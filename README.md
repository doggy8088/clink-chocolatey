# Clink: Powerful Bash-style command line editing for cmd.exe (Chocolatey package)

Project Repo: [chrisant996/clink: Bash's powerful command line editing in cmd.exe](https://chrisant996.github.io/clink/)

## Settings

Run `clink set` can display all the available options.  Run `clink set OPTION` can show the OPTION description and valid value options. e.g. `clink set terminate_autoanswer`.

If you want to show all the settings' description, run the following batch commands:

```
clink set ctrld_exits
clink set esc_clears_line
clink set match_colour
clink set exec_match_style
clink set space_prefix_match_files
clink set prompt_colour
clink set terminate_autoanswer
clink set history_file_lines
clink set history_ignore_space
clink set history_dupe_mode
clink set history_io
clink set history_expand_mode
clink set use_altgr_substitute
clink set strip_crlf_on_paste
clink set ansi_code_support
```

```yaml
         Name: ctrld_exits
  Description: Pressing Ctrl-D exits session
Current value: 1
```

<kbd>Ctrl</kbd>+<kbd>D</kbd> exits `cmd.exe` when it is pressed on an empty line.

```yaml
         Name: esc_clears_line
  Description: Toggle if pressing Esc clears line
Current value: 1
```

Clink clears the current line when Esc is pressed (unless Readline's Vi mode is enabled).


```yaml
         Name: match_colour
  Description: Match display colour
Current value: -1
```

Colour to use when displaying matches. A value less than 0 will be the opposite brightness of the default colour.

```yaml
         Name: exec_match_style
  Description: Executable match style
Current value: 2
       Values: 0 = PATH only
               1 = PATH and CWD
               2 = PATH, CWD, and directories
```

Changes how Clink will match executables when there is no path separator on the line. 0 = PATH only, 1 = PATH and CWD, 2 = PATH, CWD, and directories. In all cases both executables and directories are matched when there is a path separator present. A value of -1 will disable executable matching completely.

```yaml
         Name: space_prefix_match_files
  Description: Whitespace prefix matches files
Current value: 1
```

If the line begins with whitespace then Clink bypasses executable matching and will match all files and directories instead.

```yaml
         Name: prompt_colour
  Description: Colour of the prompt
Current value: -1
```

Surrounds the prompt in ANSI escape codes to set the prompt's colour. Disabled when the value is less than 0.

```yaml
         Name: terminate_autoanswer
  Description: Auto-answer terminate prompt
Current value: 0
       Values: 0 = Disabled
               1 = Answer 'Y'
               2 = Answer 'N'
```

Automatically answers cmd.exe's 'Terminate batch job (Y/N)?' prompts. 0 = disabled, 1 = answer 'Y', 2 = answer 'N'.

```yaml
         Name: history_file_lines
  Description: Lines of history saved to disk
Current value: 10000
```

When set to a positive integer this is the number of lines of history that will persist when Clink saves the command history to disk. Use 0 for infinite lines and <0 to disable history persistence.

```yaml
         Name: history_ignore_space
  Description: Skip adding lines prefixed with whitespace
Current value: 0
```

Ignore lines that begin with whitespace when adding lines in to the history.

```yaml
         Name: history_dupe_mode
  Description: Controls how duplicate entries are handled
Current value: 2
       Values: 0 = Always add
               1 = Ignore
               2 = Erase previous
```

If a line is a duplicate of an existing history entry Clink will erase the duplicate when this is set 2. A value of 1 will not add duplicates to the history and a value of 0 will always add lines. Note that history is not deduplicated when reading/writing to disk.

```yaml
         Name: history_io
  Description: Read/write history file each line edited
Current value: 0
```

When non-zero the history will be read from disk before editing a new line and written to disk afterwards.

```yaml
         Name: history_expand_mode
  Description: Sets how command history expansion is applied
Current value: 4
       Values: 0 = Off
               1 = On
               2 = Not in single quotes
               3 = Not in double quote
               4 = Not in any quotes
```

The `!` character in an entered line can be interpreted to introduce words from the history. This can be enabled and disable by setting this value to 1 or 0. Values or 2, 3 or 4 will skip any ! character quoted in single, double, or both quotes respectively.

```yaml
         Name: use_altgr_substitute
  Description: Support Windows' Ctrl-Alt substitute for AltGr
Current value: 1
```

Windows provides <kbd>Ctrl</kbd>+<kbd>Alt</kbd> as a substitute for <kbd>AltGr</kbd>, historically to support keyboards with no <kbd>AltGr</kbd> key. This may collide with some of Readline's bindings.

```yaml
         Name: strip_crlf_on_paste
  Description: Strips CR and LF chars on paste
Current value: 2
       Values: 0 = Paste unchanged
               1 = Strip
               2 = As space
```

Setting this to a value >0 will make Clink strip CR and LF characters from text pasted into the current line. Set this to 1 to strip all newline characters and 2 to replace them with a space.

```yaml
         Name: ansi_code_support
  Description: Enables basic ANSI escape code support
Current value: 1
```

When printing the prompt, Clink has basic built-in support for SGR ANSI escape codes to control the text colours. This is automatically disabled if a third party tool is detected that also provides this facility. It can also be disabled by setting this to 0.

## Recommended settings

* `terminate_autoanswer`

  > `clink set terminate_autoanswer 1`

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
choco push clink.1.2.0.nupkg --source https://push.chocolatey.org/
```

## How to generate SHA256 Hash of a file

> `Get-FileHash -Algorithm SHA256 -Path .\clink.1.2.0.42d871_setup.exe`
