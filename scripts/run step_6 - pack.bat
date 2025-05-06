@ECHO OFF

IF NOT EXIST ".\files\repack" MKDIR ".\files\repack"

ECHO ----------------
ECHO PACKING 0000
dotnet "%Hyouta%" ToVfps4p -m p -b 0x47 --firstalign 0x80 -a 0x10 ".\files\combined_json\combined_0000.json" ".\files\repack\0000"
ECHO ----------------
ECHO PACKING 0001
dotnet "%Hyouta%" ToVfps4p -m p -b 0x47 --firstalign 0x80 -a 0x10 ".\files\combined_json\combined_0001.json" ".\files\repack\0001"
ECHO ----------------
ECHO PACKING 0002
dotnet "%Hyouta%" ToVfps4p -m n -b 0x47 --firstalign 0x80 -a 0x1 ".\files\combined_json\combined_0002.json" ".\files\repack\0002"
ECHO ----------------
ECHO PACKING 0003
dotnet "%Hyouta%" ToVfps4p -b 0x47 --firstalign 0x80 -a 0x1 ".\files\combined_json\combined_0003.json" ".\files\repack\0003"
ECHO ----------------
ECHO PACKING TOGETHER
dotnet "%Hyouta%" ToVfps4p -c BTL_ENEMY_1722 -b 0x7 -a 0x20 -e ".\files\repack" ".\files\BTL_ENEMY_1722.DAT_notlzc"
ECHO ----------------
ECHO COMPRESSING
dotnet "%Hyouta%" tlzc -c --type 2 ".\files\BTL_ENEMY_1722.DAT_notlzc" .\BTL_ENEMY_1722.DAT