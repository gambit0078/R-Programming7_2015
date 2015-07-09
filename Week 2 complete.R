## function that reads a directory full of files and reports the number of completely
## observed cases in each data file - part 2

## 'directory' is a character vector(length=1)-location of the .csv files.
## the CSV files
## 'id' is an integer vector indicating the monitor ID numbers to be used
## Return a data frame of the form: id nobs 1 117 2 1041 ...  where 'id' is
## the monitor ID number and 'nobs' is the number of complete cases

complete <- function(directory, id = 1:332) {
  nobs <- function(id) {
    path <- file.path(directory, paste(sprintf("%03d", as.numeric(id)), ".csv", sep=""))
    return (sum(complete.cases(read.csv(path))))
  }
  return (data.frame(id=id, nobs=sapply(id, nobs)))
}

## Test complete("specdata", c(2, 4, 8, 10, 12))
## Test complete("specdata", 30:25)
