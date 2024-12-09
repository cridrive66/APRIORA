# create a new tool for the plugin that is able to find the closest vertex to the river end
# import libraries
from qgis.core import(
    QgsProject,
    QgsVectorLayer,
    QgsFeature,
    QgsGeometry,
    QgsPointXY,
    QgsCoordinateReferenceSystem,
    edit
)
from PyQt5.QtCore import QVariant
import os

# input of the tool
#river_network_path = "Y:/Dokumente/QGis projects/river routing/project with arrows/small river network.shp"
river_network_path = "C:/Users/guidi/Documents/Home office/QGis projects/river routing/project with arrows/small river network.shp" # new path for home office
river_network_layer = QgsVectorLayer(river_network_path, "river network", "ogr")
if not river_network_layer.isValid():
    print("Layer failed to load!")

# vertices of the subcatchments
#vertices_catch_path = "Y:/Dokumente/QGis projects/river routing/project with arrows/vertices_catch.shp"
vertices_catch_path = "C:/Users/guidi/Documents/Home office/QGis projects/river routing/project with arrows/vertices_catch.shp" # new path for home office
vertices_catch_layer = QgsVectorLayer(vertices_catch_path, "vertices_catch", "ogr")
if not vertices_catch_layer.isValid():
    print("Layer failed to load!")

# vertices of the end of the river network
#vertices_river_path = "Y:/Dokumente/QGis projects/river routing/project with arrows/vertices_river.shp"
vertices_river_path = "C:/Users/guidi/Documents/Home office/QGis projects/river routing/project with arrows/vertices_river.shp" # new path for home office
vertices_river_layer = QgsVectorLayer(vertices_catch_path, "vertices_river", "ogr")
if not vertices_river_layer.isValid():
    print("Layer failed to load!")

# split river network at each river vertices
# split_result = processing.run("sagang:splitlinesatpoints", {
#     'LINES': river_network_layer,
#     'SPLIT': vertices_river_layer,
#     'INTERSECT':1,
#     'OUTPUT':'TEMPORARY_OUTPUT',
#     'EPSILON':0
#     })

# split_river_layer = QgsVectorLayer(split_result["OUTPUT"], "split_river", "ogr")
split_river_path = "C:/Users/guidi/Documents/Home office/QGis projects/river routing/project with arrows/fixed_geometries.shp"
split_river_layer = QgsVectorLayer(split_river_path, "split river network", "ogr")
if not split_river_layer.isValid():
    print("Layer failed to load!")

# a little bit of debugging
for feature in split_river_layer.getFeatures():
    print(f"Feature ID: {feature.id()}, Geometry: {feature.geometry().asWkt()}")

# threshold distand (adjust as needed)
threshold = 0.01 # 1cm

# create a copy of the river network layer
#output_file_path = "Y:/Dokumente/QGis projects/river routing/project with arrows/river_network_aligned.shp" 
output_file_path = "C:/Users/guidi/Documents/Home office/QGis projects/river routing/project with arrows/river_network_aligned.shp" # new path for home office

QgsVectorFileWriter.writeAsVectorFormat(
    split_river_layer,
    output_file_path,
    "UTF-8",
    split_river_layer.crs(),
    "ESRI Shapefile"
)

# Load the copied layer
aligned_river_layer = QgsVectorLayer(output_file_path, "aligned_river_network", "ogr")
if not aligned_river_layer.isValid():
    raise Exception("Failed to create a copy of the river network layer")

# get all points from the subcatchment vertices layer
vertices_catch_points = [QgsPointXY(feature.geometry().asPoint()) for feature in vertices_catch_layer.getFeatures()]

# find the closest vertex within a threshold distance
def find_closest_vertex(point, vertices, threshold):
    closest_vertex = None
    min_distance = threshold
    for vertex in vertices:
        distance = QgsGeometry.fromPointXY(QgsPointXY(point)).distance(QgsGeometry.fromPointXY(QgsPointXY(vertex)))
        if distance < min_distance:
            closest_vertex = vertex
            min_distance = distance     # I don't think this line is needed
    return closest_vertex

# align river network vertices 
with edit(aligned_river_layer): # enable editing for river layer
    for feature in split_river_layer.getFeatures():
        geom = feature.geometry()
        if geom:
            # extract geometry points as QgsPointXY objects
            points = [QgsPointXY(point) for point in geom.vertices()]
            modified = False

            # check start vertex
            closest_start = find_closest_vertex(points[0], vertices_catch_points, threshold)
            if closest_start:
                points[0] = closest_start
                modified = True
            
            # check end vertex
            closest_end = find_closest_vertex(points[-1], vertices_catch_points, threshold)
            if closest_end:
                points[-1] = closest_end
                modified = True
            
            # update geometry if modified
            if modified:
                new_geom = QgsGeometry.fromPolylineXY(points)
                feature.setGeometry(new_geom)
                aligned_river_layer.updateFeature(feature)

                print("Vertices aligned successfully!")

del aligned_river_layer
aligned_river_layer = None