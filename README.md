# Listing-Dates
PowerShell Script made at Work to play around with PS a little bit, marginally related to my other PS Project with all the date grabbing and stuff.

The script will take all items that aren't folders and then list them in a csv file alongside their last edit date.
Was thinking about making it display time of when the last edit to the file was but excel was showing it weird so it stays like this for now.

I tried to work with arrays because i've never really done anything with those but it didn't work, i think i just applied the array wrong
and they're not supposed to do stuff like this? Either way im leaving it in but commented out just because. :)

~~Possible future additions to this project is maybe making it create a list for each folder inside the main one aswell,
adding a date of when the list was created too and not clearing old data every time. This way you could have a history 
of when you used the script and see what files you haven't done anything with in a while.~~
Done that now yippee!!

(It's not really that useful, i certainly won't use this script for anything but it's alright for a learning experience.)

# Filesizes
This script is essentially just the previous one except edited to list all the files inside a given folder alongside their filesizes. The function to empty the previous data instead of making a continuous list with a date attached is making a return here. (Just get windirstat, i just made this cuz i was once again bored and wanted to visualize my files sizes with a graph in excel)
