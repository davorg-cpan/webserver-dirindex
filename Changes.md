# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Moved `render()` method from `WebServer::DirIndex::HTML` to `WebServer::DirIndex::to_html`.
  `WebServer::DirIndex::HTML` now only provides `file_html` and `dir_html` template
  class methods; rendering is performed directly by `WebServer::DirIndex::render()`.
- Added `to_html()` method to `WebServer::DirIndex::File` that renders a single
  file entry as an HTML table row (with all fields HTML-escaped). The `render()`
  method in `WebServer::DirIndex` now delegates to this method per file.

### Added

- New `WebServer::DirIndex::File` class to encapsulate directory entry data (url, name, size, mime_type, mtime).

### Fixed

- Correct copyright date.

## [0.0.1] - 2026-02-21

### Added

- Initial release of `WebServer::DirIndex`, `WebServer::DirIndex::HTML`, and `WebServer::DirIndex::CSS`.

[Unreleased]: https://github.com/davorg-cpan/webserver-dirindex/compare/v0.0.1...HEAD
[0.0.1]: https://github.com/davorg-cpan/webserver-dirindex/releases/tag/v0.0.1
