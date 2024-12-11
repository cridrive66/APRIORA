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
# river network
#river_network_path = "Y:/Dokumente/QGis projects/river routing/project with arrows/small river network.shp"
river_network_path = "C:/Users/guidi/Documents/Home office/QGis projects/river routing/project with arrows/small river network.shp" # new path for home office
river_network_layer = QgsVectorLayer(river_network_path, "river network", "ogr")
if not river_network_layer.isValid():
    print("River network layer layer failed to load!")

# subcatchments
# subcatchments_path = "Y:/Dokumente/QGis projects/river routing/project with arrows/catchment test.shp"
subcatchments_path = "C:/Users/guidi/Documents/Home office/QGis projects/river routing/project with arrows/catchment test.shp" # new path for home office
subcatchments_layer = QgsVectorLayer(subcatchments_path, "subcatchments", "ogr")
if not subcatchments_layer.isValid():
    print("Subcatchments layer failed to load!")

# extract start [0] and end [-1] vertices from the river network
vertices_river_result = processing.run("native:extractspecificvertices", {
    'INPUT': river_network_layer,
    'VERTICES':'0, -1',
    'OUTPUT':'TEMPORARY_OUTPUT'})

vertices_river_layer = vertices_river_result["OUTPUT"]
print(f"Number of features in vertices_river_layer: {vertices_river_layer.featureCount()}")

# extract all the vertices from the subcatchments
vertices_catch_result = processing.run("native:extractvertices", {
    'INPUT':subcatchments_layer,
    'OUTPUT':'TEMPORARY_OUTPUT'})

vertices_catch_layer = vertices_catch_result["OUTPUT"]
print(f"Number of features in vertices_catch_layer: {vertices_catch_layer.featureCount()}")

# split river network at each river vertices (SAGA required)
# maybe add a trouble shooting line to check if SAGA is installed and raise a proper error
split_result = processing.run("sagang:splitlinesatpoints", {
    'LINES': river_network_layer,
    'SPLIT': vertices_river_layer,
    'INTERSECT':'TEMPORARY_OUTPUT',
    'OUTPUT': 1, # not sure about which method use
    'EPSILON':0
    })

split_river_layer = QgsVectorLayer(split_result["INTERSECT"], "split_river", "ogr")
print(f"Number of features in split_river_layer: {split_river_layer.featureCount()}")

del river_network_layer

# add it to the map and see what is the problem
#QgsProject.instance().addMapLayer(split_river_layer)

# the file has geometries that need to be fixed
fixed_result = processing.run("native:fixgeometries", {
    'INPUT':split_river_layer,
    'METHOD':1, # not sure about which method use
    'OUTPUT':'TEMPORARY_OUTPUT'})
fixed_layer = fixed_result["OUTPUT"]

print(f"Number of features in fixed_layer: {fixed_layer.featureCount()}")
del split_river_layer

# add it to the map and see what is the problem
#QgsProject.instance().addMapLayer(fixed_layer)

# remove null geometries from the layer
non_null_geom_result = processing.run("native:removenullgeometries", {
    'INPUT':fixed_layer,
    'REMOVE_EMPTY':True,
    'OUTPUT':'TEMPORARY_OUTPUT'})
non_null_geom_layer = non_null_geom_result["OUTPUT"]

print(f"Number of features in non_null_geom_layer: {non_null_geom_layer.featureCount()}")
del fixed_layer

# add it to the map and see what is the problem
QgsProject.instance().addMapLayer(non_null_geom_layer)

# threshold distand (adjust as needed)
threshold = 0.01 # 1cm

# find the closest vertex within a threshold distance
def find_closest_vertex(point, vertices, threshold):
    closest_vertex = None
    min_distance = threshold
    for vertex in vertices:
        distance = QgsGeometry.fromPointXY(QgsPointXY(point)).distance(QgsGeometry.fromPointXY(QgsPointXY(vertex)))
        if distance < min_distance:
            closest_vertex = vertex
            min_distance = distance 
    return closest_vertex

# get all points from the subcatchment vertices layer
vertices_catch_points = [QgsPointXY(feature.geometry().asPoint()) for feature in vertices_catch_layer.getFeatures()]

# collect changes before applying them
features_to_update = []

# align start points of river network vertices
for feature in non_null_geom_layer.getFeatures():
    geom = feature.geometry()
    feature_id = feature.id()
    print(f"processing feature ID: {feature_id}")

    if geom:
        # extract geometry points as QgsPointXY objects
        points = [QgsPointXY(point) for point in geom.vertices()]
        modified = False
        
        # check start vertex
        closest_start = find_closest_vertex(points[0], vertices_catch_points, threshold)
        if closest_start:
            points[0] = closest_start
            modified = True
            print(f"Found closest start vertex for feature ID {feature_id}: {closest_start}")

        # check end vertex
        closest_end = find_closest_vertex(points[-1], vertices_catch_points, threshold)
        if closest_end:
            points[-1] = closest_end
            modified = True
            print(f"Found closest end vertex for feature ID {feature_id}: {closest_end}")

        # collect changes if modified:
        if modified:
            new_geom = QgsGeometry.fromPolylineXY(points)
            feature.setGeometry(new_geom)
            features_to_update.append(feature)

# apply updates in batch mode
with edit(non_null_geom_layer):
    for feature in features_to_update:
        non_null_geom_layer.updateFeature(feature)




# ##### approach 2
# # more simple but with large dataset can be a problem
# # align start and end point river network vertices 
# with edit(non_null_geom_layer): # enable editing for river layer
#     for feature in non_null_geom_layer.getFeatures():
#         geom = feature.geometry()
#         if geom:
#             # extract geometry points as QgsPointXY objects
#             points = [QgsPointXY(point) for point in geom.vertices()]
#             modified = False
#             print(f"Original start point: {points[0]}")

#             # check start vertex
#             closest_start = find_closest_vertex(points[0], vertices_catch_points, threshold)
#             if closest_start:
#                 points[0] = closest_start
#                 modified = True
#                 print(f"Found closest start vertex: {closest_start}")

#             # check end vertex
#             closest_end = find_closest_vertex(points[-1], vertices_catch_points, threshold)
#             if closest_end:
#                 points[-1] = closest_end
#                 modified = True
#                 print(f"Found closest end vertex: {closest_end}")

#             # update geometry if modified
#             if modified:
#                 new_geom = QgsGeometry.fromPolylineXY(points)
#                 feature.setGeometry(new_geom)
#                 non_null_geom_layer.updateFeature(feature)
#                 print(f"Updated feature {feature.id()} geometry after modification")

# create a copy of the river network layer
#output_file_path = "Y:/Dokumente/QGis projects/river routing/project with arrows/river_network_aligned.shp" 
output_file_path = "C:/Users/guidi/Documents/Home office/QGis projects/river routing/project with arrows/river_network_aligned.shp" # new path for home office

QgsVectorFileWriter.writeAsVectorFormat(
    non_null_geom_layer,
    output_file_path,
    "UTF-8",
    non_null_geom_layer.crs(),
    "ESRI Shapefile"
)

del non_null_geom_layer