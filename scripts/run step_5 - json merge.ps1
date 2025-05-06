
$path = ".\files\fully_extracted_json"
# Write-Host "Current path: $((Resolve-Path -Path $path).Path)"

# grab all json
$jsonFiles_0000 = Get-ChildItem -Path $path -Filter 0000.json -Recurse | ForEach-Object { Get-Content $_.FullName | ConvertFrom-Json }
$jsonFiles_0001 = Get-ChildItem -Path $path -Filter 0001.json -Recurse | ForEach-Object { Get-Content $_.FullName | ConvertFrom-Json }
$jsonFiles_0002 = Get-ChildItem -Path $path -Filter 0002.json -Recurse | ForEach-Object { Get-Content $_.FullName | ConvertFrom-Json }

#0003 is redundant because it can only have 2 files, but whatever, I don't feel like fixing it
$jsonFiles_0003 = Get-ChildItem -Path $path -Filter 0003.json -Recurse | ForEach-Object { Get-Content $_.FullName | ConvertFrom-Json }

# set first json as the base
$merged_0000 = $jsonFiles_0000[0]
$merged_0001 = $jsonFiles_0001[0]
$merged_0002 = $jsonFiles_0002[0]
$merged_0003 = $jsonFiles_0003[0]


# add the Files section of the other JSON into the base
for ($i = 1; $i -lt $jsonFiles_0000.Count; $i++) {
    if ($jsonFiles_0000[$i].Files) {
        $merged_0000.Files += $jsonFiles_0000[$i].Files
    }
}

for ($i = 1; $i -lt $jsonFiles_0001.Count; $i++) {
    if ($jsonFiles_0001[$i].Files) {
        $merged_0001.Files += $jsonFiles_0001[$i].Files
    }
}

for ($i = 1; $i -lt $jsonFiles_0002.Count; $i++) {
    if ($jsonFiles_0002[$i].Files) {
        $merged_0002.Files += $jsonFiles_0002[$i].Files
    }
}

for ($i = 1; $i -lt $jsonFiles_0003.Count; $i++) {
    if ($jsonFiles_0003[$i].Files) {
        $merged_0003.Files += $jsonFiles_0003[$i].Files
    }
}
#-----------------------------------------------------------------------------
Write-Host "Deduplicating 0000"

$seenFiles = @{}
$merged_0000.Files = $merged_0000.Files | Where-Object {
    $filename = $_.PathOnDisk | Split-Path -Leaf
    -not $seenFiles[$filename] -and ($seenFiles[$filename] = $true)
}

#------------------------------------------------------------------------------
Write-Host "Deduplicating 0001"

$seenFiles = @{}
$merged_0001.Files = $merged_0001.Files | Where-Object {
    $filename = $_.PathOnDisk | Split-Path -Leaf
    -not $seenFiles[$filename] -and ($seenFiles[$filename] = $true)
}

#------------------------------------------------------------------------------
Write-Host "Deduplicating 0002"

$seenFiles = @{}
$merged_0002.Files = $merged_0002.Files | Where-Object {
    $filename = $_.PathOnDisk | Split-Path -Leaf
    -not $seenFiles[$filename] -and ($seenFiles[$filename] = $true)
}

#------------------------------------------------------------------------------
Write-Host "Deduplicating 0003"

$seenFiles = @{}
$merged_0003.Files = $merged_0003.Files | Where-Object {
    $filename = $_.PathOnDisk | Split-Path -Leaf
    -not $seenFiles[$filename] -and ($seenFiles[$filename] = $true)
}

#------------------------------------------------------------------------------

if (!(Test-Path .\files\combined_json)) {
  New-Item -ItemType Directory -Path .\files\combined_json | Out-Null
}

# output merged JSON
$merged_0000 | ConvertTo-Json -Depth 5 | Out-File -FilePath .\files\combined_json\combined_0000.json
$merged_0001 | ConvertTo-Json -Depth 5 | Out-File -FilePath .\files\combined_json\combined_0001.json
$merged_0002 | ConvertTo-Json -Depth 5 | Out-File -FilePath .\files\combined_json\combined_0002.json
$merged_0003 | ConvertTo-Json -Depth 5 | Out-File -FilePath .\files\combined_json\combined_0003.json