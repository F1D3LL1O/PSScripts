# PSScripts
Some useful PowerShell scripts, mostly for MS Active Directory stuff.

# Installiere_Programm_Version_ueber_Eigenschaften.ps1 and Installiere_Programm_Version_ueber_Dateiinhalt.ps1
...are mostly the same script. They inspect the directory of an application and install the desired version if it's not there yet. The first one checks a given files properties for the applications version number, the second one checks a text file for its contents.
This is pretty useful for software provisioning through GPOs when there's no MSI package.
