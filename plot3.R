# Exploratory Data Analysis
# Course Project 1
# Plot 3

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ';',
                 na.strings = '?', strip.white = TRUE,
                 blank.lines.skip = TRUE, as.is = TRUE)
# Concatenate the Date and Time columns to Date_Time column
df$Date_Time <- paste(df$Date, df$Time)
# Coerce Date_Time from character to POSIXlt POSIXt
df$Date_Time <- strptime(df$Date_Time, format = '%d/%m/%Y %H:%M:%S')
df <- subset(df, as.Date('2007-2-1') <= as.Date(df$Date_Time) &
                 as.Date(df$Date_Time) <= as.Date('2007-2-2'))
# Set time locale to en_US.UTF-8 to ensure xlab to be abbreviated weekdays
if (Sys.getlocale(category = 'LC_TIME') != 'en_US.UTF-8') {
    Sys.setlocale(category = 'LC_TIME', locale = 'en_US.UTF-8')
}

# Make Plot 3
png(filename = 'plot3.png', width = 480, height = 480)
with(df, {
     # If use title to designate xlab and ylab after plots, overlapping
     # will occur
     plot(Date_Time, Sub_metering_1, type = 'l', xlab = '',
          ylab = 'Energy sub metering')
     # MUST use lines, not plot, to add the other two lines
     lines(Date_Time, Sub_metering_2, col = 'red')
     lines(Date_Time, Sub_metering_3, col = 'blue')
     legend('topright', lty = 1, col = c('black', 'red', 'blue'),
            legend = c('Sub_metering_1', 'Sub_metering_2',
                       'Sub_metering_3'))
})
dev.off()
