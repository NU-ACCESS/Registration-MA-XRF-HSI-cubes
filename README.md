# Registration of MA-XRF and HSI cubes
***

The aim of this repository is to provide users with macros running in ImageJ (Fiji) in order to perform the registration of MA-XRF maps and hyperspectral imaging (HSI) datacubes. <br>

***

#### Requirements 

To perform the registration of MA-XRF and HSI datacubes, the requirements are as follow: <br>
>1) The latest version of [Fiji](https://fiji.sc) <br>
>2) One MA-XRF elemental map (ideally with a high contrast) <br>
>3) The RGB image of the HSI spectral stack (obtained using the RGB conversion scripts - see section *RGB conversion scripts*) <br>
>4) The *Registration_stack* macro available for download <br>
>4) The multi channels spectral stack <br>


#### Procedure 
1) Open one XRF image and the RGB image produced using the spectral stack and the RGB conversion scripts (alternatively, one can use a single channel from spectral stack instead of the RGB image - do not use the full stacks) <br>
2) Open a ROI manager (Analyze/Tools/ROI manager)
3) Hand select 7 to 15 features in the XRF image and the same features in the HSI image <br>
4) Select the HSI image and in the ROI manager click *Add*. This should produce a single ROI containing all features selected (the ROI can also be saved for future analyses through the *More/Save* menu of the ROI manager) <br>
5) Open the spectral stack and close the single spectral image <br>
6) Add the ROI to the spectral stack <br>
7) Open the *Registration_stack* macro by draging it to the ImageJ taskbar. This should open a pop up window with the macro in it <br>
8) Change the following field on line 6 of the macro: <br>
>> source_image=**name of the HSI Stack**.tif <br>
>> template_image=**name of the MA-XRF map**.tif <br>
9) With the XRF image still open (and with the features still selected from step 3) run the *Registration_stack* macro <br>
10) Once the macro will have gone through all channels of the HSI stack, the individual images needs to be combined in a new spectral stack (registered to the MA-XRF data) <br>

#### Creation of the new spectral stack (registered to the MA-XRF data)
1) Import set of individual images (File>Import/Image sequence)<br>
2) Upon opening of the pop up window, select folder in which the individual images were saved, after which the pop up window "Sequence Options" will appear <br>
3) Indicate the following field: <br>
>Number of images: number of images required to form the new stack <br>
>Starting image (usually 1) <br>
>Increment (usually 1) <br>
>All other field should be left as is <br>
4) Save new registered stack (File>Save as/Tiff)<br>


#### RGB conversion scripts
>>LambdaStack_to_XYZ <br>
>>XYZ_to_RGB <br>

Refer to [NU-ACCESS/Spectral-Microscope-Tools](https://github.com/NU-ACCESS/Spectral-Microscope-Tools) to download the required scripts

>LambdaStack_to_XYZ <br>
>>converts a stack of monochromatic wavelength images into an XYZ tristimulus space. This is accomplished by multiplying each wavelength image by the CIE 1931 Standard Observer matching function, thus producing X, Y, and Z tristimulus value images. The input parameters are the spacing between wavelengths (dependant on the camera used for acquisition, default: 2) as well as the starting and ending wavelengths (default = 393 and 750 nm).

>XYZ_to_RGB <br>
>>converts the XYZ stack into adobe RGB color space assuming a standard D65 Illuminant.

The scripts here were written in Python for use in ImageJ (Fiji) and are based on algorithms detailed in Oakley et. al. "Improved spectral imaging microscopy for cultural heritage through oblique illumination", Heritage Science, 8:1 <br>

To run the scripts, use the latest version of Fiji and place the scripts into the plugins folder. Launch Fiji or "refresh menus" if already running. <br>
Both scripts will be available in the Plugins drop-down menu. <br>
The scripts should be ran in the following order: 1) LambdaStack_to_XYZ and 2) XYZ_to_RGB. <br>
The final RGB composite image should be transformed into a RGB color image (Image>Type>RGB color) prior to be saved as a TIF image (File>Save as>Tiff)
