<#
This script allows you to effortlessly manipulate the Windows registry using a JSON file as a configuration.

Getting Started:
    1. Prepare a JSON file with the desired registry entries you want to add or remove.
    2. Invoke the RegWizard by running the script with the following commands:

Using the Function:
    - To add registry items: "regWizard -action add -file C:\path\to\config.json"
    - To remove registry items: "regWizard -action remove -file C:\path\to\config.json"

Note: The JSON file should follow the required structure for registry entries.
#>

function regWizard {
    param (
        [Parameter(Mandatory = $true)]
        [ValidateSet("add", "remove")]
        [string]$action,
        [Parameter(Mandatory = $true)]
        [string]$file
    )

    # READ JSON CONFIGURATION FILE
    $regConfigFile = Get-Content -Path $file -Raw | ConvertFrom-Json

    # EXTRACT REGISTRY CONFIGURATION FROM JSON
    $registryItems = $regConfigFile.registryItems

    try {
        # ADD REGISTRY ITEMS
        if ($action -eq "add") {
            foreach ($item in $registryItems) {
                $registryFullPath = Join-Path -Path $item.path -ChildPath $item.key

                # ADD REGISTRY KEY - IF NOT ALREADY EXISTING
                if (!(Test-Path $registryFullPath)) {
                    New-Item -Path $item.path -Name $item.key -Force | Out-Null
                }
                New-ItemProperty -Path $registryFullPath -Name $item.name -Value $item.value -PropertyType $item.type -Force | Out-Null
            }
        }
        # REMOVE REGISTRY ITEMS
        elseif ($action -eq "remove") {
            foreach ($item in $registryItems) {
                $registryFullPath = Join-Path -Path $item.path -ChildPath $item.key

                Remove-ItemProperty -Path $registryFullPath -Name $item.name -Force | Out-Null
            }
        }
        else {
            throw "Invalid action specified. Valid actions are 'add' or 'remove'."
        }
    }
    catch {
        Write-Host "An error occurred: $_"
    }
}
