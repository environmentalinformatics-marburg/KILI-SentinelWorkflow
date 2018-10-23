# Running a SNAP xml model using SNAP's graph processing tool
#

# Define path to the executable of SNAP's graph processing tool
gpt = "C:/PROGRA~1/snap/bin/gpt.exe"


# Define processing graph (i.e. the xml file from the SNAP modelling tool).
graphXml_file = "D:/sentinel/KILI-SentinelWorkflow/workflows/snap_models/Biophysind/biophysical.xml"


# Define input dataset path
# Define the folder where all input files are located.
# A loop will run over each input dataset within this folder and process it.
input_path = "D:/sentinel/data/l2a"


# Define output dataset path
output_path = "D:/sentinel/data/products"

# Start processing
# Get list of all input datasets
input_files = list.files(input_path, 
                         pattern=glob2rx("S2A_MSIL2A*.SAFE"),
                         full.names = TRUE)

# Loop over all input files and process them.
# For testing: infile = input_files[[1]]
for(infile in input_files){
  print(paste0("Processing ", infile, "*/."))
  
  # Set output filepath
  outfile = paste0("biophysical_", substr(basename(infile), 1, nchar(basename(infile))-5))
  outfile = paste0(output_path, "/", outfile, ".dim")
  
  # Compile command for graph processing tool
  cmd = paste0(gpt, " ", graphXml_file, " -e -t ", outfile, " -Pinfile=", infile)
  system(cmd)
}
