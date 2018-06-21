# Clink: Powerful Bash-style command line editing for cmd.exe (Chocolatey package)

Project Repo: [mridgers/clink: Bash's powerful command line editing in cmd.exe](https://github.com/mridgers/clink)

## How to build package

1. Update `clink.nuspec` file
    * version
    * releaseNotes
2. Update `tools\chocolateyinstall.ps1`
    * Url
    * Checksum
3. Build NuGet package
    * `choco pack`

## How to test install locally

```cmd
choco install clink -d -s .
```

## How to test uninstall locally

```cmd
choco uninstall clink -d -s .
```

## How to publish new version

```cmd
choco push clink.0.4.9.nupkg --source https://push.chocolatey.org/
```

## How to generate SHA256 Hash of a file

> `Get-FileHash -Algorithm SHA256 -Path .\clink_0.4.9_setup.exe`
