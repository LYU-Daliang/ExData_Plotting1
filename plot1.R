# Exploratory Data Analysis
# Course Project 1
# Plot 1

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ';',
                 na.strings = '?', strip.white = TRUE,
                 blank.lines.skip = TRUE, as.is = TRUE)
# Concatenate the Date and Time columns to Date_Time column
df$Date_Time <- paste(df$Date, df$Time)
# Coerce Date_Time from character to POSIXlt POSIXt
df$Date_Time <- strptime(df$Date_Time, format = '%d/%m/%Y %H:%M:%S')
df <- subset(df, as.Date('2007-2-1') <= as.Date(df$Date_Time) &
                 as.Date(df$Date_Time) <= as.Date('2007-2-2'))
# Make Plot 1
png(filename = 'plot1.png', width = 480, height = 480)
hist(df$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = 'red')
dev.off()
