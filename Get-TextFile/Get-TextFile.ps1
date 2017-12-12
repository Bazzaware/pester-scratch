
function Get-TextFileNames() {

    $path = "C:\Users\bgoodall\azure\pester-scratch\Get-TextFile\"

    Write-Host "About to get text files"

    Get-ChildItem  -Path $path| Where-Object Name -like *.txt | Select-Object -expand Name

    Write-Host "Function is finished looking for text files."
}  

$test = Get-TextFileNames