rm(list=ls())
setwd("C:/Users/raven/Desktop/biocomputing/exercise7/Biocomp-Fall2018-181012-Exercise7") 

#task1: return odd rows of any data frame
odd=function(data_frame){
  rownames=1:nrow(data_frame) # a vector of all the row numbers
  odd_items=rownames%%2==1 # a vector of TRUE/FALSE of whether each row is divisible by 2
  odd_rows=data_frame[odd_items,] # will index all the rows that leave the remainder of 1 (TRUE) when divided by 2, ie all odd rows
  return(odd_rows) # return all the odd rows
}
iris=read.csv(file="iris.csv",header=TRUE,stringsAsFactors=FALSE)
odd(iris) # Usage example