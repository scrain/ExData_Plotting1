#
# Conditionally download, unzip and prepare the data for plotting
#
if (!file.exists('household_power_consumption.zip')) {
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip')
}
if (!file.exists('household_power_consumption.txt')) {
  unzip('household_power_consumption.zip')
}
if (!file.exists('household_power_consumption_subset.csv')) {
  hhpc <- read.csv('household_power_consumption.txt', sep=';', na.strings = c('NA', '?'))

  hhpc$Date <- as.Date(hhpc$Date, "%d/%m/%Y")
  hhpc <- subset(hhpc, Date >= '2007-02-01' & Date <= '2007-02-02')
  hhpc$datetime <- as.POSIXct(paste(hhpc$Date, hhpc$Time), format='%Y-%m-%d %H:%M:%S')

  # store the result, so we only have to do this once
  write.csv(hhpc, file='household_power_consumption_subset.csv', row.names = FALSE)
}

hhpc <- read.csv('household_power_consumption_subset.csv', colClasses = c('Date', 'character', rep('numeric', 7), 'POSIXct'))
