@echo off
setlocal

for %%i in ("%~dp0..") do set "folder=%%~fi"
for %%a in ("%folder%") do set ParentDir=%%~nxa

echo ....................
echo Starting Copying
echo ....................

echo Map Name (File Name)



IF NOT "%ParentDir%"=="PRAXUS_ZEUS.Altis" XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.Bootcamp_ACR /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
IF NOT "%ParentDir%"=="PRAXUS_ZEUS.Altis" echo Altis (Altis) Copied...
IF "%ParentDir%"=="PRAXUS_ZEUS.Altis" echo Skipped Altis Copy

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.Bootcamp_ACR /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Bukovina (Bootcamp_ACR) Copied...

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.Woodland_ACR /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Bystrica (Woodland_ACR) Copied...

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.Chernarus /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Chernarus (Chernarus) Copied...

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.Chernarus_Summer /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Chernarus Summer (Chernarus_Summer) Copied...

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.Desert_E /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Desert (Desert_E) Copied...

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.Porto /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Porto (Porto) Copied...

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.ProvingGrounds_PMC /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Proving Grounds (ProvingGrounds_PMC) Copied...

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.ProvingGrounds_PMC /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Rahmadi (Intro) Copied...

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.Sara /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Sahrani (Sara) Copied...

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.Shapur_BAF /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Shapur (Shapur_BAF) Copied...

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.SaraLite /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Southren Sahrani (SaraLite) Copied...

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.Stratis /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Stratis (Stratis) Copied...

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.Mountains_ACR /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Takistan Mountains (Mountains_ACR) Copied...

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.Takistan /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Takistan (Takistan) Copied...

XCOPY ..\..\"%ParentDir%" ..\..\PRAXUS_ZEUS.Sara_dbe1 /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo United Sahrani (Sara_dbe1) Copied...

XCOPY ..\..\PRAXUS_ZEUS.Altis ..\..\PRAXUS_ZEUS.utes /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Utes (utes) Copied...

XCOPY ..\..\PRAXUS_ZEUS.Altis ..\..\PRAXUS_ZEUS.VR /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Virtual Reality (VR) Copied...

XCOPY ..\..\PRAXUS_ZEUS.Altis ..\..\PRAXUS_ZEUS.xcam_prototype /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo XCAM PROTOTYPE (xcam_prototype) Copied...

XCOPY ..\..\PRAXUS_ZEUS.Altis ..\..\PRAXUS_ZEUS.Zargabad /E /I /D /Y /V /Q /EXCLUDE:exclude.txt
echo Zargabad (Zargabad) Copied...

echo ....................
echo Finished Copying
echo ....................
pause

