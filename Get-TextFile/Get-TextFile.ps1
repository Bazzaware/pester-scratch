function Get-TextFileNames() {
    Get-ChildItem | Where-Object Name -like *.txt | Select-Object -expand Name
}  
