#
# Copyright (c) .NET Foundation and contributors. All rights reserved.
# Licensed under the MIT license. See LICENSE file in the project root for full license information.
#

$oldPath = $env:PATH
try {
    # Put the stage2 output on the front of the path
    $stage2 = "$PSScriptRoot\..\artifacts\win7-x64\stage2\bin"
    if (Test-Path $stage2) {
        $env:PATH="$stage2;$env:PATH"
    } else {
        Write-Host "You don't have a dev build in the 'artifacts\win7-x64\stage2' folder!"
    }

    dotnet @args
} finally {
    $env:PATH = $oldPath
}