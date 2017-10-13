source('load-data.R')

png(filename = "plot1.png", width = 480, height = 480)

with(
  hhpc,
  hist(Global_active_power, 
       col='red', 
       main='Global Active Power', 
       xlab='Global Active Power (kilowatts)')
)

dev.off()