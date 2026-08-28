.. _Mitigation_option:

Mitigation options
==================
| A dedicated tool for applying different mitigation options has not been designed yet. Nevertheless, it is possible to complete this task
 with some basic QGIS tools. 
| Three different options are proposed:

* :ref:`optionI`
* :ref:`optionII`
* :ref:`optionIII`

.. _optionI:

Option I: upgrade treatment type 
--------------------------------
Upgrade the treatment type means, for example, that a WWTP is upgraded from a tertiary to a quaternary treatment. Here is how to do it:

1. Go to the attribute table of **WWTP.shp**
2.	Click on the “Toggle editing mode” (pencil icon in the top left corner)
3.	Click on the “New field” icon
4.	Add a new field called *TC_upgr*, type “Integer (32 bit)”
5.	In the drop-down menu, select *TC_upgr* between all the available fields
6.	In the equation box, write *tech_class* and click on “Update All”
7.	Change the value of *TC_upgr* from one of the WWTPs to “4”
8.	Save the edit
9.	Re-do the workflow from :ref:`emission-loads` until :ref:`risk-assessment` to see the updated concentration values

.. raw:: html

  <figure>
    <iframe 
      width="700"
      height="370"
      src="https://www.youtube.com/embed/2Ub17s_DLro"
      title="Workflow of Mitigation Option I."
      allow="picture-in-picture"
      allowfullscreen>
    </iframe>
    <figcaption>Video: Workflow of <i>Mitigation Option I</i>.</figcaption>
  </figure>

.. _optionII:

Option II: relocate the WWTP
----------------------------
Another mitigation option could be to relocate the WWTP to other larger facilities with higher removal rates. It is possible to do it accordingly:

1.	Go to the attribute table of **WWTP.shp**
2.	Click on the “Toggle editing mode” (pencil icon in the top left corner)
3.	Click on the “New field” icon
4.	Add a new field called *conn_upgr*, type “Integer (32 bit)”
5.	In the drop-down menu, select *conn_upgr* between all the available fields
6.	In the equation box, write *conn_inh* and click on “Update All”
7.	Remove the value of *conn_upgr* from one WWTP and add it to another WWTP
8.	Save the edit
9.	Re-do the workflow from :ref:`emission-loads` until :ref:`risk-assessment` to see the updated concentration values

.. raw:: html

  <figure>
    <iframe 
      width="700"
      height="370"
      src="https://www.youtube.com/embed/NjxvYDVrfWE"
      title="Workflow of Mitigation Option II."
      allow="picture-in-picture"
      allowfullscreen>
    </iframe>
    <figcaption>Video: Workflow of <i>Mitigation Option II</i>.</figcaption>
  </figure>

.. _optionIII:

Option III: redirect treated effluent 
-------------------------------------
Finally, a last mitigation option is to redirect the discharge point of a WWTP to a larger or less-sensitive receiving water body. 
The steps to do this are:

1.	Left click on **emission_load.shp** in order to have it as your active layer
2.	Click on the “Toggle editing mode” (pencil icon in the top left corner)
3.	Click on “Vertex Tool”
4.	Click on the emission point that you want to redirect and move it to a different river section
5.	Save the edit
6.	Re-do the workflow from :ref:`accumulation` until :ref:`risk-assessment` to see the updated concentration values

.. raw:: html

  <figure>
    <iframe 
      width="700"
      height="370"
      src="https://www.youtube.com/embed/QfWvpIfOc-A"
      title="Workflow of Mitigation Option III."
      allow="picture-in-picture"
      allowfullscreen>
    </iframe>
    <figcaption>Video: Workflow of <i>Mitigation Option III</i>.</figcaption>
  </figure>
