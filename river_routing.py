# create a new tool for the plugin that is able to handle a river network with flow direction
# input of the tool
river_network_path = "Y:/Dokumente/QGis projects/river routing/project with arrows/Water network.shp"
river_network_layer = QgsVectorLayer(river_network_path, "Water network", "ogr")
if not river_network_layer.isValid():
    print("Layer failed to load!")

# this input is the output of the tool "flow estimation"
flow_catchment_path = "Y:/Dokumente/QGis projects/river routing/project with arrows/flow catchment.shp"
flow_catchment_layer = QgsVectorLayer(flow_catchment_path, "flow catchment", "ogr")
if not flow_catchment_layer.isValid():
    print("Layer failed to load!")


"""
Let's say that the river segments and the associated cathcments share the same code, in this case called gbk_lawa.
In future developments, add a line of code where the river network and the catchments get "intersection" and paired by a code.

"""

# join attributes by field value
processing.run("native:joinattributestable", 
{'INPUT':'Y:/Dokumente/QGis projects/river routing/project with arrows/Water network.shp|layername=Water network',
'FIELD':'gbk_lawa',
'INPUT_2':'Y:/Dokumente/QGis projects/river routing/project with arrows/flow catchment.shp',
'FIELD_2':'gbk_lawa',
'FIELDS_TO_COPY':['MQ'],
'METHOD':1,
'DISCARD_NONMATCHING':False,
'PREFIX':'',
'OUTPUT':'TEMPORARY_OUTPUT'})

# now it is time to create a new class and add it in the APRIORA_algorithm