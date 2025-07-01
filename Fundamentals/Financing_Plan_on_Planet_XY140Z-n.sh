#!/bin/bash

# Description: I need to save some money to buy a gift. I think I can do something like that:
# First week (W0) I save nothing on Sunday, 1 on Monday, 2 on Tuesday... 6 on Saturday, 
# second week (W1) 2 on Monday... 7 on Saturday and so on according to the table below where the days are numbered from 0 to 6.
# Can you tell me how much I will have for my gift on Saturday evening after I have saved 12? 
# (Your function finance(6) should return 168 which is the sum of the savings in the table).
# Imagine now that we live on planet XY140Z-n where the days of the week are numbered from 0 to n 
# (integer n > 0) and where I save from week number 0 to week number n included (in the table below n = 6).
# How much money would I have at the end of my financing plan on planet XY140Z-n?

finance() {
    local total_weeks=$1
    echo $(( (total_weeks + 1) * total_weeks * (total_weeks + 2) / 2 ))
}


