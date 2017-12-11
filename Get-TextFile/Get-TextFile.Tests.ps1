$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here${directorySeparatorChar}$sut"

function CreateFileList([string[]]$names){
    $names | ForEach-Object {
        [PSCustomObject]@{ FullName = "c:\foo\bar\$_"; Name = $_; }
    }
 
}  

Describe 'Get-TextFileNames' {
    
       It 'returns one text file when that is all there is' {
           $myList = 'a923e023.txt'
           Mock Get-ChildItem { CreateFileList $myList }
           Get-TextFileNames | Should Be 'a923e023.txt'
       }
    
       It 'returns one text file when there are assorted files' {
           $myList = 'a923e023.txt','wlke93jw3.doc'
           Mock Get-ChildItem { CreateFileList $myList }
           Get-TextFileNames | Should Be 'a923e023.txt'
       }
    
       It 'returns multiple text files amongst assorted files' {
           $myList = 'a923e023.txt','wlke93jw3.doc','ke923jd.txt','qq02000.doc'
           Mock Get-ChildItem { CreateFileList $myList }
           Get-TextFileNames | Should Be ('a923e023.txt','ke923jd.txt')
       }
    
       It 'returns nothing when there are no text files' {
           $myList = 'wlke93jw3.doc','qq02000.doc'
           Mock Get-ChildItem { CreateFileList $myList }
           Get-TextFileNames | Should BeNullOrEmpty
       }
    
   } 