$folderdates = Get-Childitem "C:\Users\Johanna\Documents\" | Where { $_.PsIsContainer -ne $true } | Sort-Object -Property LastWriteTime    #Files that arent folders are sorted by their last write time
#$arrayname = @()   !From old code!
#$arraydate = @()   !From old code!
$csvfile = "C:\Users\Johanna\Documents\lastwritedate.csv"                 #Path for csv file is attached to a variable 
If (Test-Path "$csvfile") {                                                           #check if the file above exists
     Set-Content $csvfile "Name;Date"                                                 #The first two collumns for the csv are set to "Name" and "Date", this also resets the file, should it still have old data in it
        foreach ($file in $folderdates) {
            $writetime = $file.LastWriteTime                              #1
            $writedate = $writetime.ToString("dd-MM-yyyy")                #2 The last write time is reformatted
            $filename = $file.Name 
    #        $arrayname += "Name: $file"        !From old code!
    #        $arraydate += "Date: $writedate"   !From old code!
            Add-Content $csvfile "$filename;$writedate"                   #The name and last write time of each file is added to the above listed collumns
            }
}else {
            New-item -Path "$csvfile"                                  #If the check from Line 5 returns FALSE then the csv file is created
            Set-Content $csvfile "Name;Date"                           #The rest of this runs exactly the same as the above If satetement
                foreach ($file in $folderdates) {
                    $writetime = $file.LastWriteTime
                    $writedate = $writetime.ToString("dd-MM-yyyy")
                    $filename = $file.Name
                    Add-Content $csvfile "$filename;$writedate"
                    }
            }
