#function that merges FTIR spectra from same genotype
#structure of file name is GENiRj.csv where i is an index between 1 and n and R is a number between 1 and n. 
#The function merges the files with the same j with different i and does the same for all the j.
spectramerge = function(mypath){
  for (i in 1:49){
    for (j in 1:3){
      filename=list.files(path=mypath, pattern= paste("GEN", i, "_R", j, sep=""), full.names=TRUE)
    datalist = lapply(filename, function(x){read.csv(file=x,col.names=c("Wave_N", "N"))})
    Tbl=join_all(datalist, by="Wave_N", type="left")
    write.csv(Tbl, paste("GEN", i, "R", j, ".csv", sep=""))
  }
}
}
