#!/bin/bash

# export pins 4 and 17
echo "4" > /sys/class/gpio/export
echo "17" > /sys/class/gpio/export

# set comm directions
echo "out" > /sys/class/gpio/gpio4/direction
echo "in" > /sys/class/gpio/gpio17/direction

# set pin 4 to high and wait 2 seconds
echo "1" > /sys/class/gpio/gpio4/value
sleep 2s
echo "0" > /sys/class/gpio/gpio4/value

# read state of pin 17
x=`cat /sys/class/gpio/gpio17/value`
if [ $x -eq 0 ]
then
  echo "Read $x, button is depressed"
else
  echo "Read $x, button is not depressed"
fi

# unexport the pins
echo "4" > /sys/class/gpio/unexport
echo "17" > /sys/class/gpio/unexport
  
