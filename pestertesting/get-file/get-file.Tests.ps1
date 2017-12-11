$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"
 
Describe "Get-file" {
    It "outputs 'Hello world!'" {
        Get-file | Should Be 'Hello world!'
    }
}