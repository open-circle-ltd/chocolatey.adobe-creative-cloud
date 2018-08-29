# Chocolatey Package: Adobe Creative Cloud

## Description

Creative Cloud for desktop is a great place to start any creative project. Quickly launch and update your desktop apps; manage and share your assets stored in Creative Cloud; download fonts from Adobe Typekit or high-quality royalty-free assets right within the app; and showcase and discover creative work on Behance. Best of all, the application stays out of your way but is there when you need it, so you can focus on creativity.

## Package Parameters

* `/RemoveDesktopIcons` Removes the desktop icon from Adobe Acrobat Reader DC.
* `/NoAutostartHard` Disables the Adobe Creative Cloud in the Autostart menu.

## Installation

installation without parameters.

```ps1
 choco install adobe-creative-cloud
```

installation with parameters.

```ps1
 choco install adobe-creative-cloud --params="'/NoAutostartHard /RemoveDesktopIcons'"
```

## Disclaimer

These Chocolatey Packages only contain installation routines. The software itself is downloaded from the official sources of the software developer. ITIGO AG has no affilation with the software developer.

## Author

* [Simon Bärlocher](https://sbaerlocher.ch)
* [ITIGO AG](https://www.itigo.ch)

## License

This project is under the MIT License. See the [LICENSE](LICENSE) file for the full license text.

## Copyright

(c) 2018, ITIGO AG
