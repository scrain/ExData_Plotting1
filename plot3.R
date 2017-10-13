source('load-data.R')

png(filename = "plot3.png", width = 480, height = 480)

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

dev.off()