@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

FOR /d %%f IN (.\files\unfps4\*) DO (
  IF NOT EXIST ".\files\fully_extracted_json\%%~nf" MKDIR .\files\fully_extracted_json\%%~nf
    FOR %%x IN ("%%f\*") DO (
      SET "relativePath=%%x"
      SET "relativePath=!relativePath:.\files\unfps4=!"	
      IF NOT EXIST .\files\fully_extracted!relativePath! dotnet "%Hyouta%" ToVfps4e "%%x" -j ".\files\fully_extracted_json!relativePath!.JSON" --absolute-path-in-json ".\files\fully_extracted!relativePath!"
  )
)
