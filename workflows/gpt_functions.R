# Running a SNAP xml model using SNAP's graph processing tool
#

source("D:/sentinel/KILI-SentinelWorkflow/workflows/functions/computeGPT.R")

## Create a central command (.R function) to call the snap models- files created (.xml files)
# without going all over each step-by-step, called a gpt.function by executing the comand function


computeGPT(input_path = "D:/sentinel/data/l1c", 
           output_path = "D:/sentinel/data/products", 
           gpt_exe = "C:/PROGRA~1/snap/bin/gpt.exe", 
           graphxml_filepath = "D:/sentinel/KILI-SentinelWorkflow/workflows/snap_models/")






gpttest = function(gpt) {
  graphxml_files (list.files("*.",pattern=glob2rx("*.xml"), full.names = TRUE )) 
}



for(xml_file in graphXml_files) {
  print(xml_file)
}


gpttest = function(a){
  graphXml_files = list.files(a,
                              pattern=glob2rx("*.xml"),
                              full.names = TRUE)
  for(xml_file in graphXml_files) {
    print(xml_file)
  }
}



gpt(gpt_exe =  "C:/PROGRA~1/snap/bin/gpt.exe",
    graphxml_filepath = "D:/sentinel/KILI-SentinelWorkflow/workflows/snap_models")



## create a central command for the snap models gpt function#
gptsnapmodels = function(a){
  
  graphXml_files = list.files(a,
                              pattern = glob2rx("*.xml"), 
                              full.names = TRUE)

  }
  
  for(xml_file in gptsnapmodels) {
    
 print(xml_file) 
    }
 
  ## Central command for the snap models gpt. function#

snapmodels_function  = function(a){
  graphXml_files = list.files(a,
                              pattern=glob2rx("*.xml"),
                              full.names = TRUE)
  for(xml_file in graphXml_files) {
    print(xml_file)
  }
}


##Snapmodels_function of the graph_xml files#

snapmodels_function(a) = function (a){
  graphXml_files = list.files(a, (a= xml_file),
                              pattern = glob2rx("*.xml"), 
                                    full.names= TRUE)
                                  
for(xml_file in snapmodels_function) {
                                    print(xml_file)
}

}

  
## need to substitute snapmodels_function(a)= snapmodels_function#
snapmodels_function= function(a, output){
  graphXml_files = list.files(a, 
                              pattern = glob2rx("*.xml"),
                              full.names = TRUE)
  for(xml_file in graphXml_files) {
    print(output)
  }
}





                         
snapmodels_function(a="D:/sentinel/KILI-SentinelWorkflow/workflows/snap_models/",
                    output="tesfguhfghfgjjt")          
        

## Define input dataset path, and create a variable for the input_path #

input_path = "D:/sentinel/data/l1c"
 
input_files = list.files(input_path,
  
                       pattern=glob2rx("S2A_MSIL2A*.SAFE"),
                         full.names = TRUE)
# Loop over all input files and process them#
 for(infile in input_files) {
   print(infile)
 }


## Define output name and create a variable for the output path#
output_path = "D:/sentinel/data/products"

# Get product name from xml filename and use it as prefix for the output file#
# outname = basename(infile) #remove .SAFE


outname = substring(basename(infile), 1, nchar(basename(infile))-5)





      


