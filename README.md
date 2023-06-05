# Registry Wizard

Registry Wizard is a PowerShell module that simplifies the management of Windows registry entries using a JSON-based configuration. With Registry Wizard, you can effortlessly add or remove multiple registry entries in a controlled and efficient manner.

## Features

- **Add registry items:** Easily add registry entries from a JSON configuration file.
- **Remove registry items:** Remove registry entries specified in the JSON configuration file.
- **JSON Configuration:** Configure registry entries using a structured JSON format.
- **Error Handling:** Built-in error handling for a smooth and reliable registry manipulation process.

## Install the Module

You can install the Registry Wizard module from this repository using the following command:
```powershell
Install-Module -Name RegistryWizard
```
Alternatively, you can manually download the module from the [Releases](https://github.com/Graphixa/RegistryWizard/releases) page and import into your app manually.

Note: You may need to set your execution policy to bypass or unrestricted to run this module. To do this you would use the following in a Powershell script or shell:
```Set-ExecutionPolicy Bypass```

## Initial Setup

- Prepare a JSON configuration file with the desired registry entries you want to add or remove. Follow the provided structure for registry entries.
- Import the Registry Wizard module using the following command:
   ```Import-Module -Name RegistryWizard```
- Invoke the **regWizard** function with the appropriate parameters to add or remove registry items. 

## Usage
➕ **To add registry items:**
```regWizard -Action Add -File C:\path\to\config.json```

➖ **To remove registry items:**
```regWizard -Action Remove -File C:\path\to\config.json```

Note: Replace C:\path\to\config.json with the actual path to your JSON configuration file.



## JSON Configuration Example

Here is an example of the JSON configuration file structure for adding or removing registry entries:

```json
{
  "registryItems": [
    {
      "path": "HKEY_CURRENT_USER\\Software\\MyApp",
      "key": "Settings",
      "name": "DisableTaskPreview",
      "value": "1",
      "type": "Dword"
    },
    {
      "path": "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion",
      "key": "Policies",
      "name": "DomainsAllowed",
      "value": "google.com",
      "type": "string"
    }
  ]
}
```

## Contributing
Contributions to Registry Wizard are welcome! 
If you have suggestions, improvements, or bug fixes, please submit a pull request. For major changes, please open an issue to discuss the proposed changes beforehand.
Alternatively feel free to fork a copy and make it your own :)

## License
This project is licensed under the MIT License.

### Acknowledgements
Registry Wizard was inspired by the need to simplify Windows registry management and provide an intuitive way to manipulate registry entries using a JSON configuration. We would like to thank the open-source community for their valuable contributions.
