#To temporarily load the data from a csv file
library(dplyr)
library(lubridate)

#Read csv file into r
df <- read.csv("csv file goes here")

#subset and select columns using dplyr
df<- subset(df, select = c("timestamp","latitude","longitude", "car_frame_x", "car_frame_y","car_frame_z","gyro_x","gyro_y","gyro_z"))

#Convert unix timestamp to datetime using lubridate and keep in new column
df$timer<- as_datetime(df$timestamp)

#Convert lat and long into numeric if it is a factor
df$longitude <- as.numeric(df$longitude)
df$latitude <- as.numeric(df$latitude)

#Remove wrong bearings like 0.0000000
df$longitude[df$longitude == 0] <- NA

#Remove wrong car frame data
df$car_frame_x[df$car_frame_x == 0] <- NA

#Convert datetime to seconds
df$new_time <- format(df$new_time,"%T")

#Remove all NAs
df <- na.omit(df)
