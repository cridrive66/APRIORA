.. _Hydro_Module:

Hydro-Module
============

The *Hydro-Module* provides an estimation of yearly mean flow and yearly mean low fow for each subcatchment or 
river section within a specified catchment area. This estimation is made by **Random Forest** (`source <https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.RandomForestRegressor.html>`_), 
which uses the catchment's geographical characteristics as predictors and water flow data collected from gauging stations
to calibrate and validate the approach.

This group of tools is divided in 2 different processes:

.. toctree::
  :maxdepth: 1

  fix_river
  flow_estimation_model

Both tools are documented in the following sections with explanations of their functionalities and step-by-step tutorials.