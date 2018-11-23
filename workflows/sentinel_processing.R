# Running a SNAP xml model using SNAP's graph processing tool
#

source("D:/sentinel/KILI-SentinelWorkflow/workflows/functions/computeGPT.R")

## Create a central command (.R function) to call the snap models- files created (.xml files)
# without going all over each step-by-step, called a gpt.function by executing the comand function



computeGPT(input_path = "D:/sentinel/data/l1c", 
           output_path = "D:/sentinel/data/products", 
           gpt_exe = "C:/PROGRA~1/snap/bin/gpt.exe", 
           graphxml_filepath = "D:/sentinel/KILI-SentinelWorkflow/workflows/snap_models/")



