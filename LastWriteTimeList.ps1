$folderdates = Get-Childitem "C:\Users\Johanna\Documents\" | Where { $_.PsIsContainer -ne $true } | Sort-Object -Property LastWriteTime    #Files that arent folders are sorted by their last write time
#$arrayname = @()   !From old code!
#$arraydate = @()   !From old code!
$csvfile = "C:\Users\Johanna\Documents\lastwritedate.csv"                 #Path for csv file is attached to a variable
$currentdate = Get-Date -Format "dd-MM-yyyy"							#Adding Variable for date
$currenttime = Get-Date -Format "hh:mm"								#Adding variable for time
If (Test-Path "$csvfile") {                                                           #check if the file above exists
     #Adding an initial line of rows for the collumn Filename, Last Write Date, Time of scan followed by the date and time 
     Add-Content $csvfile "Filename;Last Write Date;Time of Scan:;$currentdate;$currenttime"
        foreach ($file in $folderdates) {
            $writetime = $file.LastWriteTime                              #1
            $writedate = $writetime.ToString("dd-MM-yyyy")                #2 The last write time is reformatted
            $filename = $file.Name 
    #        $arrayname += "Name: $file"        !From old code!
    #        $arraydate += "Date: $writedate"   !From old code!
            Add-Content $csvfile "$filename;$writedate"                   #The name and last write time of each file is added to the above listed collumns
            }
     Add-Content $csvfile " ; ;"                                        #Extra empty line of rows to separate lists
}else {
          New-item -Path "$csvfile"                                   #If the check from Line 5 returns FALSE then the csv file is created
          #The rest of this runs exactly the same as the above If satetement
          Add-Content $csvfile "Filename;Last Write Date;Time of Scan:;$currentdate;$currenttime"
                foreach ($file in $folderdates) {
                    $writetime = $file.LastWriteTime
                    $writedate = $writetime.ToString("dd-MM-yyyy")
                    $filename = $file.Name
                    Add-Content $csvfile "$filename;$writedate"
                    }
                    Add-Content $csvfile " ; ;"
            }
