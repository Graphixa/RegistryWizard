# Registry Wizard

Registry Wizard is a PowerShell module that simplifies the management of Windows registry entries using a JSON-based configuration. With Registry Wizard, you can effortlessly add or remove multiple registry entries in a controlled and efficient manner.

## Features

- **Add registry items:** Easily add registry entries from a JSON configuration file.
- **Remove registry items:** Remove registry entries specified in the JSON configuration file.
- **JSON Configuration:** Configure registry entries using a structured JSON format.
- **Error Handling:** Built-in error handling for a smooth and reliable registry manipulation process.

## Installation

You can install the Registry Wizard module from the PowerShell Gallery using the following command:

```powershell
Install-Module -Name RegistryWizard
```

## Usage
- Prepare a JSON configuration file with the desired registry entries you want to add or remove. Follow the provided structure for registry entries.
- Import the Registry Wizard module using the following command:
   ```Import-Module -Name RegistryWizard```
- Invoke the **regWizard** function with the appropriate parameters to add or remove registry items. Here are some examples:
  - To add registry items: ```regWizard -Action Add -File C:\path\to\config.json```
  - To remove registry items: ```regWizard -Action Remove -File C:\path\to\config.json```
  Replace C:\path\to\config.json with the actual path to your JSON configuration file.

## Contributing
Contributions to Registry Wizard are welcome! 
If you have suggestions, improvements, or bug fixes, please submit a pull request. For major changes, please open an issue to discuss the proposed changes beforehand.

## License
This project is licensed under the MIT License.

### Acknowledgements
Registry Wizard was inspired by the need to simplify Windows registry management and provide an intuitive way to manipulate registry entries using a JSON configuration. We would like to thank the open-source community for their valuable contributions.
