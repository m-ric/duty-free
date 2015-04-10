#!/bin/bash - 

MEM=`free -m | grep Mem`
CACHE=`free -m | grep cache:`
TOTAL=`echo $MEM | awk '{print $2}'`
USED=`echo $CACHE | awk '{print $3}'`
FREE=`echo $MEM | awk '{print $4}'`
#SHARED=`echo $MEM | awk '{print $5}'`
BUFFERS=`echo $MEM | awk '{print $6}'`
CACHED=`echo $MEM | awk '{print $7}'`

REAL_USED=$((USED + CACHED + BUFFERS))
REAL_FREE=`echo $CACHE | awk '{print $4}'`

printf "Used:         %8d MB\n" $USED
printf "Free:         %8d MB\n" $REAL_FREE
printf "  Untouched:  %8d MB\n" $FREE
printf "  Buffers:    %8d MB\n" $BUFFERS
printf "  Page-Cache: %8d MB\n" $CACHED
echo "-------------------------"
printf "Total Memory: %8d MB\n" $TOTAL

