$documentfiles = Get-Childitem "C:\Users\Johanna\Documents\" | Where { $_.PsIsContainer -ne $true } 
$csvfile = "C:\Users\Johanna\Documents\filesizes.csv"        #Path for csv file is attached to a variable 
If (Test-Path "$csvfile") {                                                       #check if the file above exists
     Set-Content $csvfile " "                                               #Old Data is removed from the file
        foreach ($file in $documentfiles) {
            $filename = $file.Name 
            $filesize = $file.Length
            Add-Content $csvfile "$filename;$filesize"                 #The name and filesize of each file is added to the above listed collumns
            }
}else {
            New-item -Path "$csvfile"                                  #If the check from Line 5 returns FALSE then the csv file is created
            Set-Content $csvfile " "                           #The rest of this runs exactly the same as the above If satetement
                foreach ($file in $documentfiles) {
                    $filename = $file.Name
                    $filesize = $file.Length
                    Add-Content $csvfile "$filename;$filesize"
                    }
            }