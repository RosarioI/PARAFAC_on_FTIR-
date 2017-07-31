#function that merges FTIR spectra from same genotype
spectramerge = function(mypath){
  for (i in 1:49){
    for (j in 1:3){
      filename=list.files(path=mypath, pattern= paste("GEN", i, "_R", j, sep=""), full.names=TRUE)
    datalist = lapply(filename, function(x){read.csv(file=x,col.names=c("Wave_N", "N"))})
    Tbl=join_all(datalist, by="Wave_N", type="left")
    write.csv(Tbl, paste("GEN", i, "R", j, ".csv", sep=""))
  }
}
}#worked well