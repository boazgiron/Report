#ini -------------------------
ExtractDataPath = "W:/R/data/July/"
ExtractDataPathTarget  = paste0(ExtractDataPath,"data")

if(!dir.exists(ExtractDataPath)){
  
  dir.create(ExtractDataPath)
  dir.create(ExtractDataPathTarget)
}

pathtodata  = paste0("X:/fracas/Systems/L2",c("04","05","06","07","08","09","10","11","12","13","14","15"),"/")
names1 = c("04","05","06","07","08","09","10","11","12","13","14","15")[1:7]
pathtodata  = paste0("X:/fracas/Systems/L2",name1)

monthNum = 7

#Function -----------------
MonthZipfile <- function( dirpath, monthNum1 )
{
  zfiles = dir(dirpath,full.names=TRUE)
  zfiles = zfiles[( grepl(".Zip",zfiles) | grepl(".zip",zfiles) )]
  fitime = file.info(zfiles, extra_cols = FALSE)[,"mtime"]
  zfiles = zfiles[as.numeric(format(fitime, "%m")) >= monthNum1]
  #zfilesout  <- zfiles[order(file.info(zfiles, extra_cols = FALSE)[,"mtime"],decreasing = F)]
  zfiles
}

#main -------------------

for(pa in pathtodata ){
  
  zfiles = MonthZipfile(pa,monthNum)
  fitime = file.info(zfiles, extra_cols = FALSE)[,"mtime"]
  zfilesLast = (zfiles[order(fitime,decreasing = T)])[1]
  unout <-unzip(zfilesLast, files = "Database/*", list = T, overwrite = TRUE, 
                junkpaths = FALSE, exdir = ExtractDataPathTarget, unzip = "internal", setTimes = FALSE)
  efiles = unout$Name[grepl("Database",unout$Name)]
  unzip(zfilesLast, files = efiles, list = F, overwrite = TRUE, junkpaths = TRUE, paste0(ExtractDataPathTarget,"/",basename(pa)),unzip = "internal",  setTimes = FALSE)
  
  
  
}



