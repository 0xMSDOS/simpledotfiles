#!/bin/sh

CITY="Chiclayo, PE"
dir="$HOME/.config/bspwm/scripts/weatherV2.py"

case $1 in
  temp)
    /bin/python3 $dir --temp "$CITY";;
  icon)
    /bin/python3 $dir --icon "$CITY";;
  city)
    echo $CITY;;
esac

