.. _Installation:

Installation
============

Extra library required
----------------------
| To run the :ref:`Hydro_Module` tool, an extra library called `scikit-learn <https://scikit-learn.org/stable/>`_ is necessary and 
 is not included in the standard QGIS installation. In case you already have regionalized flow data, you can skip this step. To run the whole tool,
 an extra library called `pandas <https://pandas.pydata.org/>`_ is necessary too.
 To install the missing packages, follow the guide for your OS in the next paragraphs.

Windows
^^^^^^^

1. Open "OSGeo4W Shell", you can find it already installed with QGIS.
2. Digit::

      python -m pip install scikit-learn pandas

  Note: If the command throws a permission error, run pip3 with the --user flag::

      python -m pip install --user scikit-learn pandas

3. Press *Enter*

macOS
^^^^^

1. Open the Terminal application (press Cmd + Space, type Terminal, and press Enter)
2. Digit::

      /Applications/QGIS.app/Contents/MacOS/bin/pip3 install scikit-learn pandas

  Note: If the command throws a permission error, run pip3 with the --user flag::

      /Applications/QGIS.app/Contents/MacOS/bin/pip3 install --user scikit-learn pandas
  
3. Press *Enter*

Linux
^^^^^

1. Open your Terminal
2. Run the command matching your distribution's package manager:

  * Ubuntu / Debian / Linux Mint::
  
        sudo apt update && sudo apt install python3-sklearn python3-pandas

  * Fedora::

        sudo dnf install python3-scikit-learn python3-pandas

  * Arch Linux::

        sudo pacman -S python-scikit-learn python-pandas

3. Press *Enter*

Installation via the official QGIS repository
---------------------------------------------
1. Open QGIS and go to *Plugins* --> *Manage and Install Plugins*
2. Go to *All* and digit "APRIORA" in the search bar
3. Click on *Install Plugin*

In case you still have problems with the installation, check the video-tutorial below.

.. raw:: html

  <figure>
    <iframe 
      width="700"
      height="370"
      src="https://www.youtube.com/embed/LX5WO6Q4jGM"
      title="How to install the APRIORA plugin"
      allow="picture-in-picture"
      allowfullscreen>
    </iframe>
    <figcaption>Video: How to install the APRIORA plugin.</figcaption>
  </figure>

Installation via .zip file
--------------------------
The plugin can also be installed by downloading the .zip file from the `Github release page <https://github.com/cridrive66/APRIORA/releases>`_.
In order to do this:

1. Download the apriora.zip file of your desired version from the Github release page
2. Open QGIS and go to *Plugins* --> *Manage and Install Plugins*
3. Go to *Install from ZIP file* and select the .zip folder previously downloaded
4. Click on *Install Plugin*