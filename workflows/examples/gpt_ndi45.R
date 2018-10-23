# Running a SNAP xml model using SNAP's graph processing tool
#

# Define path to the executable of SNAP's graph processing tool
gpt = "C:/PROGRA~1/snap/bin/gpt.exe"


# Define processing graph (i.e. the xml file from the SNAP modelling tool).
graphXml_file1 = "D:/sentinel/KILI-SentinelWorkflow/workflows/snap_models/400_arvi.xml"
graphXml_file2 = "D:/sentinel/KILI-SentinelWorkflow/workflows/snap_models/401_ndi.xml"
graphXml_file3 = "D:/sentinel/KILI-SentinelWorkflow/workflows/snap_models/403_tndvi.xml"


# Define input dataset path
# Define the folder where all input files are located.
# A loop will run over each input dataset within this folder and process it.
input_path = "D:/sentinel/data/l2a"


# Define output dataset path
output_path = "D:/sentinel/data/products"

# Start processing
# Get list of all input datasets
input_files = list.files(input_path, 
                         pattern=glob2rx("*.dim"),
                         full.names = TRUE)

# Loop over all input files and process them.
# For testing: infile = input_files[[1]]
for(infile in input_files){
  print(paste0("Processing ", infile, " now."))
  
  # Set output filepath
  outfile1 = paste0("arvi_", basename(infile))
  outfile1 = paste0(output_path, "/", outfile1)
  
  outfile2 = paste0("ndi_", basename(infile))
  outfile2 = paste0(output_path, "/", outfile2)
  
  outfile3 = paste0("tndvi_", basename(infile))
  outfile3 = paste0(output_path, "/", outfile3)
  
  # Compile command for graph processing tool
  cmd1 = paste0(gpt, " ", graphXml_file1, " -e -t ", outfile1, " -Pinfile=", infile)
  cmd2 = paste0(gpt, " ", graphXml_file2, " -e -t ", outfile2, " -Pinfile=", infile)
  cmd3 = paste0(gpt, " ", graphXml_file3, " -e -t ", outfile3, " -Pinfile=", infile)
  
  system(cmd1)
  system(cmd2)
  system(cmd3)
}
