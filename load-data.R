if (!file.exists('household_power_consumption.zip')) {
  print('downloading household_power_consumption.zip')
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip')
}
if (!file.exists('household_power_consumption.txt')) {
  print('unzipping household_power_consumption.zip')
  unzip('household_power_consumption.zip')
}
if (!file.exists('household_power_consumption_subset.csv')) {
  print('creating household_power_consumption_subset.csv')
  hhpc <- read.csv('household_power_consumption.txt', sep=';', na.strings = c('NA', '?'))
  
  hhpc$Date <- as.Date(hhpc$Date, "%d/%m/%Y")
  
  hhpc <- subset(hhpc, Date >= '2007-02-01' & Date <= '2007-02-02')
  hhpc$datetime <- as.POSIXct(paste(hhpc$Date, hhpc$Time), format='%Y-%m-%d %H:%M:%S')
  
  write.csv(hhpc, file='household_power_consumption_subset.csv', row.names = FALSE)
}

hhpc <- read.csv('household_power_consumption_subset.csv', colClasses = c('Date', 'character', rep('numeric', 7), 'POSIXct'))