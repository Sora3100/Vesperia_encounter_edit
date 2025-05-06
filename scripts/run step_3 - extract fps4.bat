@ECHO OFF

FOR %%f IN (.\files\no_tlzc\*) DO (
  IF NOT EXIST .\files\unfps4\%%~nf dotnet "%Hyouta%" ToVfps4e "%%f" ".\files\unfps4\%%~nf"
)