# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.1.0]
### Fixed
- Replace legacy facts with structured facts, thanks @maxadamo! (#34)

## [3.0.0]
### Added
- Add Ubuntu 24.04 as supported OS (#28)
- Add Debian 12 as supported OS (#28)
### Changed
- Allow stdlib < 10 (#27)
### Removed
- BREAKING CHANGE: drop Puppet 6 support (#26)
- BREAKING CHANGE: drop Ubuntu 18.04 and Debian 9 support (#28)

## [2.8.0]
### Added
- Added tests (#21)
- Support Puppet 7
- Puppet types added (#22)
- Archlinux support added (#18)
- Added CHANGELOG
### Changed
- Improved README for readability (#23)
### Fixed
- Config file must require Package (#20)
- Renamed FreeBSD package (#17)
### Removed
- Support for Puppet < 6
