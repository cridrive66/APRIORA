![Network Algorithm](/help/images/APRIORA_Logo_Standard-large.png)
# APRIORA
In the project APRIORA, environmental protection agencies and wastewater treatment plants get equipped with a GIS-based risk assessment system to monitor and model concentrations of active pharmaceutical ingredients (APIs) in order to improve water management and reduce emissions. Here in this repository there is the code of the plugin. It contains several tools for different purposes: **flow estimation**, **emission loads**, **API accumulation** and **risk assessment**.

## Flow estimation
The purpose of this set of tools is to estimate mean flow and mean low flow at a river level. <br>
*1 - Fix river network*: it aligns the river network with the subcatchments' borders and calculates the contributing relationship between the different river sections. <br><br>
*2 - Contributing area of gauging station*: it calculates the upstream area of each gauging station within the catchment. <br><br>
*3 - Calculate geofactors*: it calculates the explanatory variables (geofactors) for each subcatchment. The geofactors are necessary to estimate the flow in the *Flow estimation* tool. <br><br>
*4 - Flow estimation*: it estimates the flow for each subcatchment (subcatchment level) or for each river section (river level). <br>

## Emission loads
*5 - Emission loads*: it calculates the emission load (kg/a) of a set of APIs from the discharge point of a wastewater treatment plant.

## API accumulation
*6 - API accumulation*: it calculates the accumulation and the concentration of the APIs load at each discharge point and at each river section.

## Risk assessment
*7 - Risk assessment*: identifies the extent of risk assessment of each API by calculating **environmental**, **antimicrobial resistance**, **human health** and **cumulative risk assessment**.

## Development / Funding
If you have any suggestions for improvements feel free to write an issue or create a fork.
The plugin is being developed under the project [APRIORA](https://interreg-baltic.eu/project/apriora/), funded by Interreg, grant number (*cannot find it*).
