# Chocolatey: Adobe Creative Cloud

## Description

Adobe Creative Cloud Client Installer for installing creative cloud subscription applications.

## Package Parameters

| Parameter            | Default     | Comments                                   |
| :---                 | :---        | :---                                       |
| /NOAUTOSTARTHARD | | Disables the Adobe Creative Cloud in the Autostart menu. |

## Installation

The package is created as follows.

```ps1
choco pack adobe-creative-cloud.nuspec --outputdirectory build
```

installation without parameters.

```ps1
 choco install adobe-creative-cloud -s="<path to folder>\build"
```

installation with parameters.

```ps1
 choco install adobe-creative-cloud --params="'/NOAUTOSTARTHARD'" -s="<path to folder>\build"
```

## Changelog

### 4.6.0.384

* inital commit
* add new version from Adobe Creative Cloud

## Author

* [Simon Bärlocher](https://sbaerlocher.ch)
* [ITIGO AG](https://www.itigo.ch)

## License

This project is under the MIT License. See the [LICENSE](https://sbaerlo.ch/licence) file for the full license text.

## Copyright

(c) 2018, Simon Bärlocher
(c) 2018, ITIGO AG