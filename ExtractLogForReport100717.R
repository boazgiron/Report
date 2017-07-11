lastZipfile <- function( dirpath )
{
  zfiles = dir(dirpath,full.names=TRUE)
  zfiles = zfiles[( grepl(".Zip",zfiles) | grepl(".zip",zfiles) )]
  zfilesout  <- zfiles[order(file.info(zfiles, extra_cols = FALSE)[,"mtime"],decreasing = T)]
  zfilesout[1]
}

prepareDate <- function(ds){
  
  dsout  = ( strsplit(ds,"[.]") [[1]]) [1]
  dsout 
}


pathtodata  = paste0("X:/fracas/Systems/L2",c("04","05","06","07","08","09","10","11","12","13","14","15"),"/")
pathtodata = pathtodata[1:7]

zipfiles  = unlist(lapply(pathtodata,lastZipfile))
renames = unlist(lapply(re,function(x){(strsplit(x,"_")[[1]])[4]}))
names1 = paste0("C:/Temp/target/",renames)

i=0
for ( ezip in zipfiles ){
  i=i+1
  unout <-unzip(ezip, files = "Logs/*", list = T, overwrite = TRUE, junkpaths = FALSE, exdir = "c:/Temp", unzip = "internal", setTimes = FALSE)
  efiles = unout$Name[grepl("ServiceLogFile.mpba",unout$Name)  ]
  unzip(ezip, files = efiles, list = F, overwrite = TRUE, junkpaths = FALSE,names1[i],unzip = "internal",  setTimes = FALSE)
}



filesNames= dir("X:/RD/Team Members/Yifat/LabCorp/Burlington/May 2017/data/204/")


basicPath1  = "X:/RD/Team Members/Yifat/LabCorp/Burlington/May 2017/"
basicPath2 =  "X:/RD/Team Members/Yifat/LabCorp/Raritan/May 2017/"
zipfiles1 = dir(basicPath1,full.names = T )
zipfiles2 = dir(basicPath2,full.names = T )
zipfiles2_ = NULL
for(z in zipfiles2){
  
  zipfiles2_  = c(zipfiles2_,dir(z,full.names = T ))
  
}
zipfiles2 = zipfiles2_
rm(zipfiles2_)

zipfiles1 = zipfiles1[( grepl(".Zip",zipfiles1) | grepl(".zip",zipfiles1) )]
zipfiles2 = zipfiles2[( grepl(".Zip",zipfiles2) | grepl(".zip",zipfile2) )]
names12 = unlist(lapply(zipfiles1,function(x){(strsplit(x,"_")[[1]])[4]}))
names22 = unlist(lapply(zipfiles2,function(x){(strsplit(x,"/")[[1]])[8]}))
targetbasic = "C:/Temp/target/"
names_2 = c(names12,names22)
names1 = paste0(targetbasic,names_2)
zipfiles =c(zipfiles1,zipfiles2)


i=0
for ( ezip in zipfiles ){
  i=i+1
  unout <-unzip(ezip, files = "Logs/*", list = T, overwrite = TRUE, junkpaths = FALSE, exdir = "c:/Temp", unzip = "internal", setTimes = FALSE)
  efiles = unout$Name[grepl("ServiceLogFile.mpba",unout$Name)  ]
  unzip(ezip, files = efiles, list = F, overwrite = TRUE, junkpaths = FALSE,names1[i],unzip = "internal",  setTimes = FALSE)
}
  

runstring1 = "C:/4.4.3forBoazOnly_/MPBALoggerViewer.exe "
df = paste0("C:/Temp/Target/",names2,"/Logs/ServiceLogFile.mpba")
dft = paste0("C:/Temp/Target/",names2,"/Logs/ServiceLogFile.txt")
i=0
for(fl in df){
  i =i+1
  runstring2 = paste0(runstring1,fl," -search  SAVE_ALL_TEXT ",dft[i])
  system(runstring2,wait = T ) 
  
}


dft = paste0("C:/Temp/Target/",names2,"/Logs/ServiceLogFile.txt")
for(fl in dft[3]){
  da =read.csv(fl,header = F,stringsAsFactors = F,sep = ";")
  colnames(da) <-c("Date","Type","process","mass")
  SystemTest25Process
  da1 = da[grepl("SystemTest25Process",da$process) & grepl("Starting SystemTest",da$mass),]
  da1 = da[grepl("Starting SystemTest",da$mass),]
}
  
sum(grepl("Starting SystemTest",View(da$mass)))  
da$mass

