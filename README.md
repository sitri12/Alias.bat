# Alias.bat

Quick and dirty ALIAS command written in Batch for windows

USAGE:


ALIAS [-A &lt;alias> &lt;command>][-I][-L][-F &lt;file>][-h [&lt;alias>]]

ALIAS   : Processes the alias.config file and sets up aliases

-A      : Create a simple alias with a simple command (eg. ALIAS -A clear cls)

-I      : Interactive mode for creating more complex aliases with multiple parts

-L      : Lists all aliases and commands in ALIAS.CONFIG file

-F      : For using a file other than the default (alias.config)

-H      : Displays this page or the description of the named alias

NOTE: if invoking -F &lt;file> with other options it must be done first
