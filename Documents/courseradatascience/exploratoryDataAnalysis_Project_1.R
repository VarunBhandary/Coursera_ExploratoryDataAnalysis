##       The exploratoryDataAnalysis_Project_1.R does the following.
##       1. 

library(sqldf)

# Download the zipped data file from the URL and save the contents at 
# a specific location

DataZipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
DataZipFileName <- "UCI HAR Dataset.zip"

if (!file.exists(DataZipFileName)) {
        download.file(DataZipUrl, DataZipFileName, mode = "wb")
}
print(paste(c("Data downloaded from the URL "), DataZipUrl))

dataPath <- "UCI HAR Dataset"
if (file.exists(dataPath)) {
        unzip(DataZipFileName)
} else {
        dir.create(dataPath)
        unzip(DataZipFileName)
}
print(paste(c("Unzipped the data to the following folder"), dataPath))

# read power consumption data
powerConsumptionData <- read.csv.sql("household_power_consumption.txt", "select *, from file where Date = '01/02/2007' or Date = '2/2/2007 ", sep = ";")
