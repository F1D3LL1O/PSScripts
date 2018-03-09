".........................####...##..##..######..##......##......######..######...####...##..##........................"
"........................##......##..##..##......##......##......##........##....##......##..##........................"
".........................####...######..####....##......##......####......##.....####...######........................"
"............................##..##..##..##......##......##......##........##........##..##..##........................"
".........................####...##..##..######..######..######..##......######...####...##..##........................"
"......................................................................................................................"
".####....####...#####...######..#####...######...####...........######...####...#####...........##..##...####...##..##"
"##......##..##..##..##....##....##..##....##....##..............##......##..##..##..##...........####...##..##..##..##"
".####...##......#####.....##....#####.....##.....####...........####....##..##..#####.............##....##..##..##..##"
"....##..##..##..##..##....##....##........##........##..........##......##..##..##..##............##....##..##..##..##"
".####....####...##..##..######..##........##.....####...........##.......####...##..##............##.....####....####."
"......................................................................................................................"

#Setze Programmnamen
$progName = "Supertolles Programm"
#Setze aktuell gewünscherte Version auf:
$desiredProgVer = "17.0"
#Setze Name der zu überprüfenden Datei
$dateiname = "\Tolle Firma\Supertolles Programm\Datei_mit_Version_im_Inhalt.txt"
#Setze installierte Version auf 0
$installedVer = 0
#Setze Bool für Installation
$gehtWeiter = 0
#Baue kompletten Pfad zur Datei
$64bitPath = ${env:ProgramFiles} + $dateiname
$32bitPath = ${env:ProgramFiles(x86)} + $dateiname

Write-Host ("Installation von " + $progName)

#Überprüfe auf aktuell installierte Version und vergleiche sie mit der Gewünschten.

#Überprüfe, ob der Pfad im 64-Bit-Programmverzeichnis verfügbar ist
if (Test-Path $64bitPath) {
    #Wenn der 64-Bit-Pfad gefunden wurde, überprüfe Dateiversion.
    $installedVer = Get-Content($64bitPath)
    if ($installedVer -lt $desiredProgVer) {
        #Wenn sie kleiner als die Gewünschte ist, geht es weiter.
        $gehtWeiter = 1
    }
    else {
        #Sonst beende diese Schleife.
    }
}
else {
    #Wenn der 64-Bit-Pfad nicht gefunden wurde, überprüfe, ob der Pfad im 32-Bit-Programmverzeichnis verfügbar ist.
    if (Test-Path $32bitPath) {
        #Wenn der 32-Bit-Pfad gefunden wurde, überprüfe Dateiversion.
        $installedVer = Get-Content($32bitPath)
        if ($installedVer -lt $desiredProgVer) {
            #Wenn sie kleiner als die Gewünschte ist, geht es weiter.
            $gehtWeiter = 1
        }
        else {
            #Sonst beende diese Schleife.
        }
    }
    else {
        #Wenn weder der 64-, noch der 32-Bit-Pfad gefunden wurden, installiere frisch.
        $gehtWeiter = 1
    }
}

if ($gehtWeiter) {
    #Wenn keine gewünschte Version gefunden wurde, installiere.
    Write-Host ("Starte Installation von " + $progName + ".")
    Set-Location "\\server\software\Supertolles Programm"
    & .\Programminstaller_17_0.exe /S
    Write-Host ("Skript beendet.")
}
else {
    #Sonst beende.
    Write-Host ("Gewünschte Version von " + $progName + " ist bereits vorhanden. Beende das Skript.")
}
