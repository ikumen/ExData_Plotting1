# The MIT License (MIT)
# 
# Copyright (c) 2015 ikumen@gnoht.com
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#     
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


#
# Description
#
# Generates a histogram for "Global Active Power" values taken from UC Irvine
# Machine Learning Repository, specifically the "Electric power consumption"
# dataset.
# See https://github.com/rdpeng/ExData_Plotting1 plot 1 for an example.
#
# Note: this script assumes "household_power_consumption.txt" data file
# is within the same directory as this script. 
#

# read data in, converting ? (missing values) to NA
df <- read.table(file = "household_power_consumption.txt", sep = ";",
                 na.strings=c("?"), 
                 header=TRUE, 
                 colClasses = c(Global_active_power="numeric"))

# convert char date col to Date obj so we can math on it
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# date range we will filter by
begin_date = as.Date("2007-02-01")
end_date = as.Date("2007-02-02")

# note: our filter is inclusive on begin and end dates, and 
# we only want observations with !NA
df <- df[((df$Date >= begin_date & df$Date <= end_date) & 
             !is.na(df$Global_active_power)), 
         c("Global_active_power")] # only attr needed for this plot

# open png device for writing to
png(file = "plot1.png", width = 480, height = 480)

# create hist plot
hist(df, xlab = "Global Active Power (kilowatts)",
     col = "red", main = "Global Active Power")

# close device
dev.off()

