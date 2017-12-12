$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

function CreateFileList([string[]]$names){
    $names | ForEach-Object {
        [PSCustomObject]@{ FullName = "c:\foo\bar\$_"; Name = $_; }
    }
 
}

<#
Describe 'Get-TextFileNames' {
    It 'returns two text files' {
        Get-TextFileNames | Should Be ('TestFileInFolder01.txt','TestFileInFolder03.txt')
    }
}
#>

<#
Describe 'Get-TextFileNames' {
	    It 'returns one text file' {
	        Mock Get-ChildItem { [PSCustomObject]@{ Name = 'a923e023.txt' } }
	        Get-TextFileNames | Should Be 'a923e023.txt'
	    }
    }

#>
<#
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
#>

<#
Describe 'Get-TextFileNames' {
    
     ContextUsing "file combinations" (
    
       # Data for test #1
       ('a923e023.txt', # the $files parameter
        'a923e023.txt', # the $expectedResult parameter
        'one text file when that is all there is'), # the description parameter
    
       # Data for test #2
       (('a923e023.txt','wlke93jw3.doc'),
        'a923e023.txt',
        'one text file when there are assorted files'),
    
       # Data for test #3
       (('a923e023.txt','wlke93jw3.doc','ke923jd.txt','qq02000.doc'),
        ('a923e023.txt','ke923jd.txt'),
        'multiple text files amongst assorted files'),
    
       # Data for test #4
       (('wlke93jw3.doc','qq02000.doc'),
        $null,
        'nothing when there are no text files')
    
     ) {
       param($files, $expectedResult, $description)
    
          It "returns $description" {
             Mock Get-ChildItem { CreateFileList $files }
             Get-TextFileNames | Should Be $expectedResult
         }
     }
    }
#>