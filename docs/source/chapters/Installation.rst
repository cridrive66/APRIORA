.. _Installation:

Installation for Windows
========================

Extra library required
----------------------
| To run the :ref:`Hydro_Module` tool, an extra library called `scikit-learn <https://scikit-learn.org/stable/>`_ is necessary and 
 is not included in the standard QGIS installation. In case you already have regionalized flow data, you can skip this step. To run the whole tool,
 an extra library called `pandas <https://pandas.pydata.org/>`_ is necessary too.
 To install the missing packages:

1. Open "OSGeo4W Shell", you can find it already installed with QGIS.
2. Digit::

      python -m pip install scikit-learn pandas

3. Press *Enter*

Installation via the official QGIS repository
---------------------------------------------
1. Open QGIS and go to *Plugins* --> *Manage and Install Plugins*
2. Go to *All* and digit "APRIORA" in the search bar
3. Click on *Install Plugin*

In case you still have problems with the installation, check the video-tutorial below.

.. raw:: html

   <figure>
     <video width="700" height="370" controls>
       <source src="../_static/video/installation.mp4" type="video/mp4">
       Your browser does not support the video tag.
     </video>
     <figcaption>Video: How to install the APRIORA plugin.</figcaption>
   </figure>

Installation via .zip file
--------------------------
The plugin can also be installed by downloading the .zip file from the Github repository (`link <https://github.com/cridrive66/APRIORA/releases>`_).
In order to do this:

1. Download the apriora.zip file of your desired version from the Github release page
2. Open QGIS and go to *Plugins* --> *Manage and Install Plugins*
3. Go to *Install from ZIP file* and select the .zip folder previously downloaded
4. Click on *Install Plugin*