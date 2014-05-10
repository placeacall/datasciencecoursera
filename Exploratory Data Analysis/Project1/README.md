Project 1
===================

This repository contains PNG images and R Code used in creating the objects.

Before you start, the R Script runFirst.R must be run.
The following actions are performed once the script is run

1. Download and Unzip file
2. Install and load sqldf package
3. Load dates 1st and 2nd February into power data frame
4. transform date and time into completeDate

Output
A data frame named power

The following descriptions of the 10 variables available in the power dataframe

Date: Date in format dd/mm/yyyy
Time: time in format hh:mm:ss
Global_active_power: household global minute-averaged active power (in kilowatt)
Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
Voltage: minute-averaged voltage (in volt)
Global_intensity: household global minute-averaged current intensity (in ampere)
Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.