## function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate 
## for monitor locations- Part 3

## 'directory' is a character vector(length=1)-location of the .csv files.

## 'threshold' is a numeric vector (length 1)-indicating the number of
## completely observed observations (on all variables) required to compute
## the correlation between nitrate and sulfate; the default is 0.

## Return a numeric vector of correlations

corr <- function(directory, threshold = 0) {
        df = complete(directory)
        ids = df[df["nobs"] > threshold, ]$id
        corrr = numeric()
            for (i in ids) {
  newRead = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), 
                           ".csv", sep = ""))
  dff = newRead[complete.cases(newRead), ]
  corrr = c(corrr, cor(dff$sulfate, dff$nitrate))
}
return(corrr)
}

## Test cr <- corr("specdata", 150) 
##      head(cr)
