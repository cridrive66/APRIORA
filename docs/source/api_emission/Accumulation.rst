.. _accumulation:

Accumulation
------------
| This tool combine the output of :ref:`flow-estimation-tool` with the output of :ref:`emission-loads`. In this part, the load of the selected APIs is transferred to 
 the river network and the concentration for *mean flow* and *mean low flow* condition is calculated.
| In the first step, each emission point is projected onto the closest river section, where a new sub-section is created to integrate the WWTP discharge. 
 In the example shown in :numref:`accumulation_division-fig`, three river sections and one WWTP are considered. The emission point is connected to river section 2, which is then divided into 2A 
 and 2B. Because flow direction is from section 1 toward section 3, the load is transferred downstream to 2B and 3, while sections 1 and 2A remain unaffected by API inputs. 
 From section 2B onward then, the emitted load is accumulated along the river network. 
| After splitting, the mean flow and mean low flow of section 2 (the affected section) is proportionally redistributed between 2A and 2B (the new sub-sections) according to 
 their relative lengths.

.. _accumulation_division-fig:

.. figure::
    images/accumulation_division.png

    How the division in extra river sections at WWTPs works within the plugin.

Once all WWTP emission points have been processed this way, API loads are progressively accumulated downstream along the network. Based on these accumulated loads and the 
flow values stored in the river shapefile, API concentrations are then calculated for each river section with formula :math:numref:`accumulation_equation`. 
Two values are derived: concentration under mean flow conditions and concentration under mean low flow conditions.

.. math::
    :label: accumulation_equation

    PEC = \frac{\sum (m_{WW,eff})_{up}}{Q} \cdot k
    

With:

- :math:`PEC` = Predicted Environmental Concentration [:math:`ng/L`]
- :math:`(m_{WW,eff})_{up}` = load from all the upstream river section [:math:`kg/a`]
- :math:`Q` = mean flow or mean low flow [:math:`m^3\!/s`] 
- :math:`k` = conversion factor [:math:`\frac{ng/kg \cdot m^3\!/L}{s/a}`]

If WWTP annual effluent was added by the user in :ref:`emission-loads`, a shapefile can be produced containing the dilution ratio calculated 
for each river section according to formula :math:numref:`dilution_equation`.

.. math::
    :label: dilution_equation

    DR = \frac{\sum Q_{riv} - \sum Q_{WWTP,eff}}{\sum Q_{WWTP,eff}}
    

With:

- :math:`DR` = Dilution Ratio [:math:`-`]
- :math:`Q_{riv}` = flow rate of river section [:math:`m^3\!/a`]
- :math:`Q_{WWTP,eff}` = flow rate of WWTP effluent [:math:`m^3\!/a`]

Additionally, if the user would like to calculate the modelled concentration at sampling campaign locations, it is possible to do so by providing to the tool 
a point shapefile. Thanks to this output, it will be easy to compare monitored vs modelled values and evaluate the performances of the model.

Input data
^^^^^^^^^^
The following input data are required for this tool:

* **emission_loads.shp** (from :ref:`emission-loads`)
* **river_level.shp** (from :ref:`flow-estimation-tool`)
* **monitoring_stations.shp** [optional] 

In case the user already has regionalized flow data, going through the :ref:`Hydro_Module` set of tools is not necessary. 
The important fields that should be in **river_level.shp** are:

- ID field: a column with a unique ID for each river section
- Next field: a column with the ID of the downstream river section 
- Accumulated mean flow: sum of the upstream mean flow values [:math:`m^3\!/s`]
- Accumulated mean low flow: sum of the upstream mean low flow values [:math:`m^3\!/s`]

Regarding **emission_loads.shp**, the emission point should be at maximum 500 m from the closest river section, as stated before. If not, edit the location of the point.
Same regarding **monitoring_stations.shp**.


Workflow
^^^^^^^^

1. Add the input data to the project by clicking on "Layer -> Add Layer -> Add Vector Layer"
2. Go in the Processing Toolbox and look for the *APRIORA* plugin. Click on *API emission* and open *7 - Accumulation*
3. Choose **emission_loads.shp** as input for *API load*
4. Select the fields containing the APIs to accumulate. This selection should include only columns containing load of APIs in kg/a.
5. Choose **river_level.shp** as input for *River network*
6. | Select the correct field of **river_level.shp** for *ID Field*, *Next Field*, *Mean Flow*, *Acc. Mean Flow*, *Mean Low Flow* and *Acc. Mean Low Flow*. 
     In case **river_level.shp** is the output of :ref:`flow-estimation-tool`, here are the correct fields to select:
    
     - *ID Field* -> NET_ID
     - *Next Field* -> NET_TO
     - *Acc. Mean Flow* -> acc_Mean
     - *Acc. Mean Low Flow* -> acc_M_Low

Optional:
7. Choose **monitoring_stations.shp** as input for *Monitoring Point*
8. Click on the three dots positioned in the right of *Monitoring station with modelled values* and select a saving option
9. Repeat step 8 for *Dilution Ratio*
10. Click on *Run*

.. raw:: html

  <figure>
    <iframe 
      width="700"
      height="370"
      src="https://www.youtube.com/embed/wHNWsz_VIas"
      title="Workflow of the Accumulation tool."
      allow="picture-in-picture"
      allowfullscreen>
    </iframe>
    <figcaption>Video: Workflow of the <i>Accumulation</i> tool.</figcaption>
  </figure>

Output data:

* **river_accumulation.shp**
* **monitoring_stations_with_modelled_values.shp** [optional]
* **dilution_ratio.shp** [optional]

The output **river_accumulation.shp** is a line shapefile containing the updated geometry of the river network. Its attribute table contains, for each section, the emitted load, the
accumulated load and the resulting concentrations under both normal and low-flow condition for each API. :numref:`accumulation_table` shows only a part of the attribute table 
for one substance and a few river sections.

.. _accumulation_table:

.. list-table:: Example of attribute table of river_accumulation.shp.
    :header-rows: 1
    :widths: 15 15 15 15 15 15

    * - NET_ID
      - NET_TO
      - Carb[kg/a]
      - acc_Carb [#f1]_
      - conc_Carb [#f2]_
      - conL_Carb [#f3]_
    * - 1005
      - 1006
      - 0
      - 17.789
      - 39.422
      - 150.251
    * - 1006
      - 1007
      - 0
      - 17.789
      - 39.265
      - 149.398
    * - 1007
      - 1008A
      - 0
      - 17.789
      - 39.134
      - 148.712
    * - 1008A
      - 1008B
      - 0
      - 17.789
      - 38.615
      - 148.277
    * - 1008B
      - 1009
      - 3.68
      - 21.469
      - 41.873
      - 168.519
    * - 1009
      - 1010
      - 0
      - 21.469
      - 41.671
      - 167.611
    * - 1010
      - 1011
      - 0
      - 21.469
      - 41.368
      - 166.652
    * - 1011
      - 1012
      - 0
      - 21.469
      - 40.693
      - 164.549
    
.. [#f1] Accumulation of Carbamazepine [:math:`kg/a`]
.. [#f2] Concentration of Carbamazepine in normal conditions [:math:`ng/L`]
.. [#f3] Concentration of Carbamazepine in low flow conditions [:math:`ng/L`]


The output **monitoring_stations_with_modelled_values.shp** is a point shapefile with the same geometry of **monitoring_stations.shp** and its attribute table is 
very similar to what is shown in :numref:`accumulation_table`.

The output of **dilution_ratio.shp** is a point shapefile with the same geometry of **emission_loads.shp** and its attribute table contains two extra columns,
*Q_Riv* and *Dilu_Ratio*, which are respectively the flow rate of receving river section before its conversion in [:math:`m^3\!/a`] and the dilution ratio.