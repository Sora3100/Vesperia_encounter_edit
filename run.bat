@ECHO OFF

CD /d "%~dp0"

NET SESSION >NUL 2>&1
IF NOT %ERRORLEVEL% == 0 (
    ECHO Please run this as Admin.
    PAUSE
    GOTO :EOF
)

IF NOT EXIST "HyoutaToolsCLI.dll" (
  ECHO HyoutaTools does not exist...
  ECHO Please extract HyoutaTools into this folder.
  PAUSE
  GOTO :EOF
)

set Hyouta=.\HyoutaToolsCLI.dll

IF NOT EXIST "chara" (
  IF EXIST "chara.svo" (
    ECHO Extracting chara.svo...
	REM step 0
    dotnet %Hyouta% ToVfps4e chara.svo chara/
  ) ELSE (
    ECHO chara.svo is missing...
    ECHO Please move chara.svo from "\Tales of Vesperia Definitive Edition\Data64\" into this folder.
    PAUSE
    GOTO :EOF
  )
) ELSE (
  ECHO Skipping chara.svo extraction...
)

ECHO STEP 0 DONE

:: step 1
CALL ".\scripts\run step_1 - symlink files to tlzc.bat"
ECHO STEP 1 DONE

:: step 2
CALL ".\scripts\run step_2 - untlzc.bat"
ECHO STEP 2 DONE

:: step 3
CALL ".\scripts\run step_3 - extract fps4.bat"
ECHO STEP 3 DONE

:: step 4
CALL ".\scripts\run step_4 - extract sub fps4.bat"
ECHO STEP 4 DONE

:: step 5
powershell -Command "Set-ExecutionPolicy Unrestricted -Force"
powershell -File ".\scripts\run step_5 - json merge.ps1"
ECHO STEP 5 DONE

:: step 6
CALL ".\scripts\run step_6 - pack.bat"
ECHO STEP 6 DONE

ECHO Finished.
ECHO Put the "BTL_ENEMY_1722.DAT" file into the "chara" folder from the folder with "run.bat".
ECHO Then move or rename the file "chara.svo" from the folder with "run.bat" in "\Tales of Vesperia Definitive Edition\Data64\"
ECHO (Make sure to back up or move files)
ECHO Afterward, move the "chara" folder from the folder with "run.bat" into "\Tales of Vesperia Definitive Edition\Data64\"
ECHO Start the Estellise fight either from the Cheat Engine table, or from Namco Banda Isle.
ECHO WARNING: Entering any town (including Namco Banda Isle) after the fight will crash the game. This includes escaping, winning or losing the fight.
ECHO Enjoy!
PAUSE