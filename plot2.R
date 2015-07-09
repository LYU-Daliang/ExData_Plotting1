# Exploratory Data Analysis
# Course Project 1
# Plot 2

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

# Make Plot 2
png(filename = 'plot2.png', width = 480, height = 480)
with(df, plot(Date_Time, Global_active_power, type = 'l', xlab = '',
              ylab = 'Global Active Power (kilowatts)'))
dev.off()
