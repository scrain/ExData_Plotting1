source('load-data.R')

png(filename = "plot4.png", bg = 'transparent', width = 480, height = 480)

par(mfrow=c(2,2))

# upper left plot
with(
  hhpc,
  plot(datetime,
       Global_active_power,
       type='l',
       ylab='Global Active Power (kilowatts)',
       xlab='') # cleared xlab to better match what was shown in the instructions
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
       ylab='Energy sub metering',
       xlab='') # cleared xlab to better match what was shown in the instructions?
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
  bty='n', # remove border around legend
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
