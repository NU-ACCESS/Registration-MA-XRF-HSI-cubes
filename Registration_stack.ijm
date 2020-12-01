new_dir = getDirectory("Choose a Directory for SAVING"); 
//setBatchMode(true);
for (i=1; i<nSlices+1;i++) {
	setSlice(i);
	t=getImageID();
		run("Landmark Correspondences", "source_image=HSI_Stack.tif template_image=MA-XRF_map.tif transformation_method=[Least Squares] alpha=1 mesh_resolution=32 transformation_class=Affine interpolate");
		saveAs("Tiff", new_dir + i + ".tif");
		run("Close");
		}
