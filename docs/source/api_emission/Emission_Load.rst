.. _emission-loads:

Emission Loads
==============
This tool is giving the user the access to the APRIORA's internal database related to consumption data and removal rates.
Finally, it calculates the load of previously selected APIs at each WWTP within a catchmment. 

The tool contains 3 different windows:

* :ref:`consumption_data`
* :ref:`removal_rate`
* :ref:`emission_loads_window`

In the next paragraphs, the functionalities of each windows are described. More detailed instruction on how to use them can be found in the video-tutorial 
in the **Workflow** sections below.

.. _consumption_data:

Consumption data
----------------
| Here the user can explore the consumption data related to several substances, with different spatial and temporal coverage. 
 The consumption data is expressed in *mg/inh./a* and it is already including the excretion rate from the human body. When a regional coverage is not available, 
 it is marked as "-" and the national value is considered instead. The consumption values are calculated with the formula :math:numref:`consumption_equation`.

.. math::
    :label: consumption_equation

    m_{i,y} = ((m_{cp,y} + m_{cs,y}) \cdot e)/n_{pop}
    

With:

- :math:`m_{i,y}` = yearly consumption of y API [:math:`mg/inh/a`]
- :math:`m_{cp,y}` = yearly prescribed API intake [:math:`kg/a`]
- :math:`m_{cs,y}` = yearly sold over-the-counter API intake [:math:`kg/a`]
- :math:`e` = API specific excretion rate [-]
- :math:`n_{pop}` = population in the reference area for intake data  [-]


| In case the user would like to add a new substance in the database or the same substance but with a different coverage, it is possible to
 do it by clicking on the "+" icon. A new row is added at the bottom of the table and the user should fill out the cells with important information like: API input, API name,
 year, country and region. The other fields can be kept empty. In case a wrongful substance is added, it is possible to select it and then remove it with the "-" icon. 
 If the user would like to go back to the core table, simply click on "Restore original".

Input data
^^^^^^^^^^
For this tool no input data is required. All the necessary input data (consumption values) are already provided. In case the user would like to add their own input data,
it is possible to do so.

Workflow
^^^^^^^^

1. Go in the Processing Toolbox and look for the *APRIORA* plugin. Click on *API emission* and open *3 - Emission Loads*
2. Go on the "Consumption data" window
3. Explore the database and find the APIs that you are interested in (e.g., Carbamazepine and Diclofenac for 2023, Germany, MV)
4. Select the substances, click on "Add to the selection" and the substance will be added in the "Selected consumption data" window
5. Repeat the steps 3&4 with all the interested APIs

In case the user would like to add custom substances:

6. Click on the "+" icon
7. Go to the bottom of the table and fill out the "API input", "API name", "year", "country" and "region" fields. The other fields can be kept empty.
8. Add to the selection the newly added API by repeating the steps 3&4.

In case the user would like to share the consumption table with other users or import it from other users:

* Click on the three dots in the top left corner and select "Export table (for sharing only)"
* Click on the three dots in the top left corner and select "Import external consumption table"

.. raw:: html

  <figure>
    <iframe 
      width="700"
      height="370"
      src="https://www.youtube.com/embed/0Bnd1SeY5Jk"
      title="Workflow of the 'Consumption data' window in the Emission Loads tool."
      allow="picture-in-picture"
      allowfullscreen>
    </iframe>
    <figcaption>Video: Workflow of the <i>Consumption data</i> window in the <i>Emission Loads</i> tool.</figcaption>
  </figure>

.. _removal_rate:

Removal rate
------------
| This window contains a table with the removal rates of different APIs for the 4 different types of treatment: TC1 (primary treatment), screening 
 and sedimentation; TC2 (secondary treatment), aeration and bacterial digestion; TC3 (tertiary treatment), nutrient removal, filtration and chlorine/UV; TC4 (quaternary treatment), 
 activated carbon and reverse osmosis. This table provides cumulative removal rates for each treatment stage. This means the value for a given stage (e.g., TC3) already includes 
 the combined removal efficiency of all previous stages (TC1 and TC2). Therefore the calculation is direct and not sequential.
| With a similar logic like before, the user can add a new substance (or edit the current value) by clicking on the "+" icon.

Input data
^^^^^^^^^^
For this tool no input data is required. All the necessary input data (removal rates) are already provided. In case the user would like to add their own input data,
it is possible to do so.

Workflow
^^^^^^^^

1. Go on the "Removal rate" window
2. Check if the values for the different APIs and different technical classes are correct
3. To change something, simply double click on a number and update the value
4. To add a new substance, click on the "+" icon and fill out all the fields ("CAS No." can be kept empty)

In case the user would like to share the removal rate table with other users or import it from other users:

* Click on the three dots in the top left corner and select "Export table (for sharing only)"
* Click on the three dots in the top left corner and select "Import external consumption table"

.. raw:: html

  <figure>
    <iframe 
      width="700"
      height="370"
      src="https://www.youtube.com/embed/fQTD_ip7Iwg"
      title="Workflow of the 'Removal rate' window in the Emission Loads tool."
      allow="picture-in-picture"
      allowfullscreen>
    </iframe>
    <figcaption>Video: Workflow of the <i>Removal rate</i> window in the <i>Emission Loads</i> tool.</figcaption>
  </figure>

.. _emission_loads_window:

Emission Loads
--------------
| In case the user would like to further customize the input data like consumption and removal rates at a more detailed level, here it is possible to do so.
 By selecting the WWTPs shapefile and the correct fields for ID, name and technical class, it is possible to display the consumption values and removal rates
 for each WWTPs included in the shapefile. By doing so, the user can edit a consumption values or a removal rate for that specific WWTP.

Input data
^^^^^^^^^^
One input data is necessary for this tool:

* **WWTP.shp**

The **WWTP.shp** is a point shapefile containing the emission point of the WWTPs as geometry and important information of the facilities in the attribute table. The required
information are: ID and name of the WWTP; number of connected inhabitant; number representing the type of treatment (1=primary, 2=secondary, 3=tertiary, 4=quaternary);
optionally, the annual effluent flow from the WWTP in order to calculate the dilution ratio in :ref:`accumulation`. 
An example of these information can be summarized in :numref:`WWTP-attribute-table`.

.. _WWTP-attribute-table:

.. list-table:: Example of attribute table with required data for WWTPs.
    :header-rows: 1
    :widths: 15 30 20 20

    * - ID
      - Name
      - Connected Inhabitants
      - Type of treatment
    * - 163
      - KA Vorbeck
      - 98
      - 2
    * - 202
      - KA Groß Lüsewitz
      - 913
      - 1
    * - 691
      - KA Schwaan
      - 10004
      - 3
    * - 156
      - KA Hanstorf
      - 312
      - 2
    * - 169
      - KA Güstrow/Parum
      - 34333
      - 3


.. important::
    The column "Type of treatment" needs to be a number from 1 to 4.
    The emission point should be within 500 m to the closest river section.

Next, the load is calculated according to the formula :math:numref:`load_equation`:

.. math::
    :label: load_equation

    m_{WW,eff} = i_{WWTP} \cdot m_{i,y} \cdot (1 - r_{WWTP}) \cdot 10^{-6}
    

With:

- :math:`m_{WW,eff}` = load [:math:`kg/a`]
- :math:`i_{WWTP}` = connected inhabitants [:math:`inh`]
- :math:`m_{i,y}` = yearly consumption of y API [:math:`mg/inh/a`] 
- :math:`r_{WWTP}` = removal rate  [-]

The plugin retrieves the technical class assigned to each treatmant plant and identifies the corresponding removal rate for each API
from the data pool. This value (:math:`r_{WWTP}`) is then used as input for formula :math:numref:`load_equation` to calculate the
reduced emissions after treatment.


Workflow
^^^^^^^^

1. Go on the "Emission loads" window
2. Select the WWTP shapefile and specify the field for *ID*, *name* and *technical class*
3. Click on "Load Table"
4. Check the consumption values and removal rates at each WWTPs. In case you would like to change something, double click on a number and update the value.

In case the user would like to share the WWTP locations table with other users or import it from other users:

* Click on the three dots in the top left corner and select "Export table (for sharing only)"
* Click on the three dots in the top left corner and select "Import external consumption table"

After making (or not) all the necessary changes, the user can then proceed by:

5. Specify the correct field for *Connected Inhabitants* and (optionally) for *WWTP annual effluent flow*
6. Click on *Calculate emission loads*

.. raw:: html

  <figure>
    <iframe 
      width="700"
      height="370"
      src="https://www.youtube.com/embed/IPTMiqraXGk"
      title="Workflow of the 'Emission Loads' window in the Emission Loads tool."
      allow="picture-in-picture"
      allowfullscreen>
    </iframe>
    <figcaption>Video: Workflow of the <i>Emission Loads</i> window in the <i>Emission Loads</i> tool.</figcaption>
  </figure>

Output data:

* **emission_loads.shp**

The output is a point shapefile with the same geometry as the **WWTP.shp**. The attribute table contains the *ID* and *Name* columns from **WWTP.shp** and 
*n* columns related to the emission load of *n* selected APIs (e.g., if the user selects 3 APIs, 3 load columns are added). Finally, the load is expressed in *kg/a*.
Optionally, if the user added also WWTP annual effluent information, a column containing this value will be present in the **emission_loads.shp**.
