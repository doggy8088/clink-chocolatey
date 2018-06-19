<#
  .SYNOPSIS
 
  Get the uninstaller location for most Windows software.
 
  .DESCRIPTION
 
  This function finds the correct uninstaller given just an application name.
  Find the name from the Programs and Features Control Panel window.
 
  .PARAMETER Name
 
  The name of the application, as found in the Programs and Features applet
  in the Control Panel.
 
  .EXAMPLE
 
  Uninstall-ChocolateyPackage 'foo' 'EXE' '/S' (Get-Uninstaller -Name 'Foo')
 
  .LINK
 
  https://github.com/AnthonyMastrean/chocolateypackages/blob/9eb1dfaa6e2d4139eea84fb31a2883bb3ac4b824/packages/openra/tools/uninstall.ps1
#>
function Get-Uninstaller {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $Name
    )
   
    $local_key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
    $machine_key32 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
    $machine_key64 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
   
    @($local_key, $machine_key32, $machine_key64) `
        | ? { Test-Path $_ } `
        | Get-ItemProperty `
        | ? { $_.DisplayName -eq $Name } `
        | Select-Object -ExpandProperty UninstallString
}