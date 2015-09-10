# Assets #
Assets are the required files for Hack Doom conveniently packaged into an archive.

## Directory Structure ##
In the base of the *assets* directory are the compiled files, notably the *hackdoom.pk3* archive, that are required to be loaded for play.  WAD files created in the *levels* directory must be designed to be loaded with the *hackdoom.pk3* compiled archive.

The other directories contain the source material used to create the archive.  They conform to the ZDoom Wiki [specification](http://zdoom.org/wiki/Using_ZIPs_as_WAD_replacement) though not all are required to be present.  This includes the following:
* **acs**:  contains ACS libraries.
* **flats**:  *flats* files.
* **graphics**:  special graphics not present in WADs.
* **hires**:  high-resolution textures.
* **maps**:  certain levels, not likely to be used in Hack Doom.
* **music**:  all music.
* **sounds**:  sound files referenced by SNDINFO.
* **sprites**:  sprites.
* **textures**:  textures.

## PK3 Archive Creation ##
For most cases, the prebuilt *hackdoom.pk3* in the base of the *assets* directory should be sufficient.  However, if you wish to build it yourself it is not complicated.  I will cover using [SLADE](http://slade.mancubus.net/) though any archive editor and [ACC](http://zdoom.org/wiki/ACC) will be just fine.
* Open SLADE and create a new archive in the base of *assets* called *hackdoom.pk3*.
* Import File and select *hack-doom/assets/acs/hackdoom.acs* file for import.
* Select the file, then click, "compile ACS." This will create a *acs* subdirectory with the *hackdoom.acs* compiled ACC object.
 * If you had not configured SLADE to locate ACC it will prompt you to do so.
 * If you get a *hackdoom.o* instead of a compiled *hackdoom.acs* simply rename it though it may work just fine.
* Save the archive, close SLADE.

## Level Preparation ##
Aside from the usual conventions for creating levels a small amount of modification must be made to the WAD file to load the assets.  In this case we use the **LOADACS** function of ZDoom.
* Open the WAD file in your chosen editor (at this time I recommend [SLADE](http://slade.mancubus.net/).
* Create a new lump ("Entry" in SLADE) and call it LOADACS.
* Type the following into the entry:

> hackdoom // Hack Doom scripts

* Save the lump / Entry, save the WAD, close your chosen editor.

## Usage ##
When launching the WAD for Hack Doom you'll need to simply specify the *hackdoom.pk3* file as well as the Hack Doom WAD file.
> zdoom -iwad doom2.wad -file ./levels/hackdoom001.wad ./assets/hackdoom.pk3
