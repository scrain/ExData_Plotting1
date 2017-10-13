source('load-data.R')

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

# upper left plot
with(
  hhpc, 
  plot(datetime, 
       Global_active_power, 
       type='l', 
       xlab='',
       ylab='Global Active Power (kilowatts)')
)

# upper right plot
with(
  hhpc, 
  plot(datetime, 
       Voltage, 
       type='l')
)

# lower left plot
with(
  hhpc,
  plot(datetime, Sub_metering_1,
       type='l',
       ylab='Energy sub metering')
)

with(
  hhpc,
  lines(datetime, Sub_metering_2,
        type='l',
        col='red')
)

with(
  hhpc,
  lines(datetime, Sub_metering_3,
        type='l',
        col='blue')
)

legend(
  'topright', 
  col=c('black', 'red', 'blue'),
  lty=1,
  legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
)

# lower right plot
with(
  hhpc, 
  plot(datetime, 
       Global_reactive_power, 
       type='l')
)

dev.off()