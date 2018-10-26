rm(list=ls())
setwd("C:/Users/raven/Desktop/biocomputing/exercise7/Biocomp-Fall2018-181012-Exercise7") 

#I assume that any data frame you work on will be pre-existent in the working directory, and you have to read the csv file in

#task1: return odd rows of any data frame
odd=function(filename){
  data_frame=read.csv(file=filename,header=TRUE,stringsAsFactors=FALSE)
  rownames=1:nrow(data_frame) # a vector of all the row numbers
  odd_items=rownames%%2==1 # a vector of TRUE/FALSE of whether each row is divisible by 2
  odd_rows=data_frame[odd_items,] # will index all the rows that leave the remainder of 1 (TRUE) when divided by 2, ie all odd rows
  return(odd_rows) # return all the odd rows
}
odd("iris.csv") # Usage example


#task2.1: return number of observations for a given species included in some data set
observations=function(filename,species){
  data_frame=read.csv(file=filename,header=TRUE,stringsAsFactors=FALSE)
  speciescount=numeric((nrow(data_frame))) #first create a numeric vector that contains 0s, each one corresponding to a row in iris
  for (i in 1:nrow(data_frame)) {
    if (data_frame[i,5]==species) {speciescount[i]=1} #loop through each row in iris. If species name matches, set that corresponding index in the speciescount vector to 1
  }
  speciestally=sum(speciescount) #sum the speciescount vector. The sum=1*number_of_times_species_name_matched=number_of_observations_for_that_species
  return(speciestally) #return that count
}
observations("iris.csv","virginica") # Usage example
(iriscountspecies=as.data.frame(table(iris$Species))) #Check against this frequency table
#even though a for loop may not be necessary, I think this code is useful because you also generate within the local environment a vector where you keep track of which species were observed on which days, and a slight tweak of this code can create more detailed functionality

#task2.2: return dataframe for flowers with Sepal.Width>=some value in some data set
widesepal=function(filename,x){
  data_frame=read.csv(file=filename,header=TRUE,stringsAsFactors=FALSE)
  widesepal_frame=data_frame[data_frame[,2]>x,] #Sepal width is column 2. If 2nd column>x, then for that row, index all the columns
  return(widesepal_frame)
}
widesepal("iris.csv",3.7) # Usage example
all(widesepal("iris.csv",3.7)==iris[iris$Sepal.Width>3.7,]) #Check against this. Returns TRUE, meaning the two data sets have the same values

#task2.3: write data for a species from some data set to a new csv file titled speciesname.csv
species_csv=function(filename,species){
  data_frame=read.csv(file=filename,header=TRUE,stringsAsFactors=FALSE)
  write.table(data_frame[data_frame$Species==species,],file=paste(species,".csv",sep=""),sep=",")
}
species_csv("iris.csv","versicolor") # Usage example
