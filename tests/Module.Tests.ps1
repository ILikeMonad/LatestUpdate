# AppVeyor Testing
If (Test-Path 'env:APPVEYOR_BUILD_FOLDER') {
    $manifest = "$env:APPVEYOR_BUILD_FOLDER\LatestUpdate\LatestUpdate.psd1"
    $module = "$env:APPVEYOR_BUILD_FOLDER\LatestUpdate\LatestUpdate.psm1"
}
Else {
    # Local Testing 
    $manifest = "$(Split-Path -Parent -Path $MyInvocation.MyCommand.Definition)\..\LatestUpdate\LatestUpdate.psd1"
    $module = "$(Split-Path -Parent -Path $MyInvocation.MyCommand.Definition)\..\LatestUpdate\LatestUpdate.psm1"
}

Describe 'Module Metadata Validation' {      
    It 'Script fileinfo should be OK' {
        {Test-ModuleManifest $manifest -ErrorAction Stop} | Should Not Throw
    }   
    It 'Import module should be OK' {
        {Import-Module $module -Force -ErrorAction Stop} | Should Not Throw
    }
}