@ECHO OFF

IF NOT EXIST ".\files\no_tlzc" MKDIR ".\files\no_tlzc"

FOR %%f IN (.\files\tlzc\*) DO (
  IF NOT EXIST .\files\no_tlzc\%%~nxf dotnet "%Hyouta%" tlzc -d "%%f" ".\files\no_tlzc\%%~nxf"
)