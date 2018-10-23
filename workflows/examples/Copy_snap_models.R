# Running a SNAP xml model using SNAP's graph processing tool
#
a = 4
b = 6
c = 8+3
d = 'halo'

# Define path to the executable of SNAP's graph processing tool
gpt = "C:/PROGRA~1/snap/bin/gpt.exe"


# Get a list of all xml modelling files in the respective folder (i.e. snap_models).
# graphXml_file = "D:/sentinel/KILI-SentinelWorkflow/workflows/snap_models/400_arvi.xml"
# graphXml_file = list("D:/sentinel/KILI-SentinelWorkflow/workflows/snap_models/400_arvi.xml",
#                      "D:/sentinel/KILI-SentinelWorkflow/workflows/snap_models/401_ndi.xml",
#                      "D:/sentinel/KILI-SentinelWorkflow/workflows/snap_models/402_tsavi.xml")
graphXml_file = list.files(path="D:/sentinel/KILI-SentinelWorkflow/workflows/snap_models/",
                           pattern=glob2rx("*.xml"),
                           full.names = TRUE)

# Define input dataset path
# Define the folder where all input files are located.
# A loop will run over each input dataset within this folder and process it.
input_path = "D:/sentinel/data/l2a"


# Define output dataset path
output_path = "D:/sentinel/data/products"

# Start processing
# Get list of all input datasets
input_files = list.files(path=input_path, 
                         pattern=glob2rx("*.dim"),
                         full.names=TRUE)

# Loop over all input files and process them.
# For testing: infile = input_files[[1]]
for(infile in input_files){
  print(paste0("Processing ", infile, "*.dim"))
  
  
  # Loop over all xml files, create the output filename and run the command.
  for(outfile in out_files){"output_path, outfile, "*.dim}
    
    # Set output filepath
    # Get product name from xml filename and use it as prefix for the output file
    prefix = (as.list(400:403))
    outfile = paste0(prefix, "_", basename(infile))
    outfile = paste0(output_path, "/", outfile)
    
    # Compile command for graph processing tool
    cmd = paste0(gpt, " ", graphXml_file, " -e -t ", outfile, " -Pinfile=", infile)
    system(cmd)
  }
}
