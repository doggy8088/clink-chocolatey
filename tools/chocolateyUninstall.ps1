$tools = Split-Path $MyInvocation.MyCommand.Definition

Uninstall-ChocolateyPackage `
    -PackageName 'clink' `
    -File 'C:\Program Files (x86)\clink\1.2.0.42d871\clink_uninstall_1.2.0.42d871.exe' `
    -FileType 'EXE' `
    -SilentArgs '/S'