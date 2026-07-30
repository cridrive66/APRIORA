---
title: 'APRIORA Plugin: From Flow Estimation to Pharmaceutical Risk Assessment in QGIS'
tags:
- Python
- QGIS
- pharmaceuticals
- hydrological model
- risk assessment
authors:
- name: Cristiano Guidi
  orcid:
  equal-contrib: true
  affiliation: 1
affiliations:
- name: Geodesy and Geoinformatics, University of Rostock, Justus-von-Liebig-Weg 6, 18059 Rostock, Germany
  index: 1
date: 14 July 2026
bibliography: paper.bib
---

# Summary

APRIORA is an open-source QGIS plugin developed for spatial modelling and risk assessment of active pharmaceutical ingredients (APIs) in river basins. By combining pharmaceutical statistics, connected inhabitants and river hydrology, the tool calculates predicted environmental concentrations (PECs) and risk quotients (RQs) for three different types of risk: environmental, antimicrobial resistance and human health. The plugin also includes a hydrological module to estimate river flows where external data is missing. To support environmental agencies and regional and local authorities, APRIORA can be used to apply different modelling scenarios on a catchment scale to simulate and compare the effectiveness of mitigation strategies.

# Statement of need

Pharmaceuticals are essential in modern healthcare and they enter surface waters primarily through wastewater treatment plant (WWTP) effluents [@kosekImplementationAdvancedMicropollutants2020b]. Even at low concentrations, APIs pose documented ecotoxicological risks to non-target organisms [@daughtonPharmaceuticalsPersonalCare1999; @hoegerWaterborneDiclofenacAffects2005; @williamsNationalRiskAssessment2010]. Driven by demographic shifts and rising drug consumption [@trancknerDemographicEffectsDomestic2010; @bennadiSelfmedicationCurrentChallenge2013; @IQVIA-2025_2029_prediction], European water management policy has intensified its focus on API mitigation. Particularly, the updated EU Urban Wastewater Treatment Directive (UWWTD) mandates quaternary treatment upgrades for large WWTPs (>= 150.000 population equivalents (PE)) and requires risk-based prioritization for upgrading mid-sized facilities (10.000 to 150.000 PE) by 2045 based on discharge dilution and receiving water sensitivity [@EU_Directive_2024_3019].

While the UWWTD focuses primarily on medium and large infrastructure, small-sized WWTPs (< 10.000 PE) are frequently overlooked. However, small facilities discharging into tributaries or low-flow streams often create pollution hotspots due to critical mixing ratios between the emission load and receiving flow volume [@buttnerWhyWastewaterTreatment2022; @disabatinoResponsesFreshwaterInvertebrates2024]. At a catchment level, these distributed upstream discharges create localized ecotoxicological risks along individual river sections and substantial cumulative pollution loads reaching sensitive marine basins downstream, such as the Baltic Sea, which is one of the most polluted marine water bodies in the world [@reuschBalticSeaTime2018]. Risk characterization usually involves calculating RQs by comparing PECs with Predicted No-Effect Concentrations (PNECs) [@kisieliusProcessDesignRemoval2023] or legally more binding Environmental Quality Standards (EQSs), as updated under Directive 2026/80 [@Directive2026805].

To deal with these evolving directives, environmental protection agencies (EPAs), regional and local authorities and WWTP operators require a unified, accessible methodology to model surface water API concentrations, assess spatially distributed risk and prioritize mitigation strategies within river catchments.

Although there are established exposure and emission models, such as stand-alone packages (MoRE [@fuchsModelingRegionalizedEmissions2017], ePiE [@oldenkampHighResolutionSpatialModel2018]), ArcGIS extensions (GREAT-ER [@kehreinModelingFateDownthedrain2015]) and complex research frameworks (STREAM-EU [@lindimLargescaleModelSimulating2016]), their practical adoption by regional decision-makers is affected by commercial software restrictions, high technical barriers to entry, non-adaptable spatial domains and a lack of direct scenario testing capabilities. APRIORA fills this critical gap as a free and open-source QGIS plugin by allowing its end-users to independently map RQs and evaluate interactive mitigation scenarios such as WWTP upgrades, effluent redirection, or discharge relocation.

# State of the field

To evaluate the water quality of river networks or catchments, several tools already exist, such as those cited previously: ePiE, STREAM-EU, GREAT-ER and MoRE offer distinct modelling capabilities, yet each presents operational challenges for regional applications. ePiE simulates first-order degradation kinetics and phase transport across European basins, but it relies on EU-wide reporting databases, automatically excluding small WWTPs (<2000 PE), leading to systematic exposure underestimation in upstream tributaries. Furthermore, the model is distributed as an R package, compromising its user-friendliness for authorities in charge who might not be skilled in R or basic coding. STREAM-EU provides dynamic, fugacity-based multi-media fate simulations, yet requires extensive physico-chemical and environmental parameterization that turns routine regional screening into a computationally heavy task. GREAT-ER computes reach-specific probabilistic concentration distributions via Monte Carlo simulations; however, it requires a commercial license for ArcGIS software and laborious data preparation for the catchment under investigation. Meanwhile, MoRE provides comprehensive multi-tier regionalized emission calculations, but it is a closed-distribution platform that requires direct coordination with its maintainers. Additionally, it aggregates pollutant loads over large spatial analytical units (>100 km^2) rather than providing continuous, segment-by-segment river risk profiles.

A fundamental requirement across all these tools is accurate hydrological flow data to calculate in-river substance dilution and concentrations. Existing frameworks depend entirely on pre-defined external hydrological models or global databases (such as FLO1K for ePiE, LARSIM for MoRE or SWAT for GREAT-ER) limiting their adaptability in data-scarce or in regions where local hydrological data are available. Refactoring one of these existing models into a free and open-source QGIS plugin was technically unfeasible, making a standalone build the best option.

APRIORA provides its own hydrological module to estimate flow, while still keeping the possibility for users to import external hydrological datasets. Additionally, it provides an environment where users can freely customize input parameters including local API consumption, WWTP removal efficiencies, PNEC thresholds and monitoring data. Beyond standard environmental risk assessment (ERA), its framework also supports human health (HHRA) and antimicrobial resistance (AMR-RA) evaluations. It can also simulate environmental propagation for other micropollutants such as PFAS or microplastics whenever emission or consumption data are available. Finally, different mitigation scenario can be tested to support authorities in the decision-making process.

# Software design

The APRIORA plugin is an open-source QGIS extension designed to make pharmaceutical risk modelling easy to use for regional decision-makers and environmental agencies working under the UWWTD. Its main design goal is to provide a low technical barrier to entry by using mostly publicly available data and fitting directly into standard QGIS workflows. The plugin is organized into two main modules containing five total tools:
- Hydro-Module: preprocesses stream vector lines (*1 - Fix River Network*) and estimates river flow in data-scarce catchments (*2 - Flow Estimation*)
- API Emission: calculates pollutant loads from WWTP (*3 - Emission Loads*), routes these loads downstream (*4 - Accumulation*) and perform risk assessment (*5 - Risk Assessment*)

A scheme of the plugin is illustrated in Fig. 1.

(add Figure 1)

To make the tool useful across different regions, several practical trade-offs were built into the software design. First, the Hydro-Module works with standard European databases like Copernicus DEM, ERA5 precipitation and CORINE Land Cover, while still allowing users to use local data. Because precipitation data formats can differ between sources (such as ERA5 using single multi-year NetCDF files and local agencies like the German Weather Service using annual rasters), the interface includes a flexible toggle switch so users do not have to manually reformat their files.
Additionally, spatial data structures can vary country by country. While downstream routing usually relies on line networks, some databases (like Finland's Vemala model) store hydrological data as polygons. Because of this reason, *4 - Accumulation* and *5 - Risk Assessment* were designed to accept both linear river networks and polygon layers, letting users choose whichever spatial format fits best.

Finally, the plugin is characterised by high user customization. APRIORA comes pre-loaded with consumption data, removal rates and PNEC thresholds for ten common APIs across five Baltic Sea region countries. Users can easily update these parameters or even adjust them for the individual WWTPs within the study catchment. To simplify the collaboration between different users, these customized setups can be exported as simple tables and shared with colleagues, guaranteeing that everyone can reproduce the exact same model run without typing values in by hand.

# Research impact statement

Developed as part of the EU Interreg-sponsored APRIORA project (https://interreg-baltic.eu/project/apriora/), the plugin was tested and refined based on direct feedback from project partners and environmental authorities. The tool was first introduced to the public in November 2025 at the EMPEREST final conference in Berlin, where around 20 regional stakeholders took part in a workshop on using the API Emission set of tools (https://interreg-baltic.eu/project-posts/apriora/successful-apriora-stakeholder-workshop-in-berlin/). A similar workshop was held in June 2026 in Rostock with about 15 regional stakeholders from the Mecklenburg-Western Pomerania region. In July 2026, the plugin was taught during the APRIORA One Health Summer School in Gdansk, where 50 participants were trained on using the tool (https://ilc.enhanceuniversity.eu/opportunities/132).

The research impact of APRIORA is shown through its application across five river catchments in Germany, Sweden, Finland, Latvia and Poland. Consortium partners used the plugin to model pharmaceutical risks and test local mitigation options under different conditions. These case studies formed the basis for pilot reports which can be found in the APRIORA project website (https://interreg-baltic.eu/project-pilots/piloting-in-latvia/, https://interreg-baltic.eu/project-pilots/piloting-in-sweden/, https://interreg-baltic.eu/project-pilots/piloting-in-finland/, https://interreg-baltic.eu/project-pilots/piloting-in-poland/, https://interreg-baltic.eu/project-pilots/piloting-in-germany/). Additionally, a scientific paper about the development and application of the plugin is under writing.

# AI usage disclosure

Generative AI tools were used during the software development and paper writing process. AI was used to help write parts of the Python code, troubleshoot errors, and proofread the manuscript text. All AI-generated code was manually reviewed, tested, and verified by the developer through catchment modeling runs before the software was published. All the text was reviewed and edited by the author to make sure it was factually correct.

# Acknowledgments

The project leading to this application is funded by the Interreg Baltic Sea Region Programme. Co-founded by the European Union (ERDF), this #MadeWithInterreg project helps to remove pollutants from our waters. The developer would also like to thank all the project partners, regional stakeholders and users who contributed to the development of the plugin by providing continuous feedback and ideas on how to improve it.

# References