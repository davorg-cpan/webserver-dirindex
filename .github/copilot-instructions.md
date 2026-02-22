# Copilot Instructions for webserver-dirindex

## Repository Overview

This is a Perl CPAN distribution (`WebServer::DirIndex`) that provides directory
index data for web server listings. It reads a filesystem directory and builds
the data needed to render an Apache-style directory index HTML page.

## Module Structure

```
lib/
  WebServer/
    DirIndex.pm         # Main module: reads a directory, exposes file entries
    DirIndex/
      File.pm           # Represents a single file/directory entry
      HTML.pm           # Renders the HTML directory index page
      CSS.pm            # Provides standard and "pretty" CSS stylesheets
t/
  webserver_dirindex.t        # Tests for WebServer::DirIndex
  webserver_dirindex_file.t   # Tests for WebServer::DirIndex::File
  webserver_dirindex_css.t    # Tests for WebServer::DirIndex::CSS
  webserver_dirindex_html.t   # Tests for WebServer::DirIndex::HTML
```

## Language and Coding Style

- **Perl** using the modern `class`/`field`/`method` syntax provided by
  `Feature::Compat::Class` (backport of the Perl 5.38+ `use feature 'class'`).
- All modules begin with `use strict; use warnings; use Feature::Compat::Class;`
  and declare classes with `class Foo::Bar vX.Y.Z { ... }`.
- Fields are declared with `field $name :param;` (required) or
  `field $name :param = default;` (optional with default).
- Accessor methods are declared with `method name { return $name }`.
- Class (static) methods use `sub` instead of `method`.
- POD documentation follows `__END__` in every module file.

## Build and Test

All commands must be run from the repository root.

### Install dependencies

```bash
cpanm --installdeps .
```

### Build

```bash
perl Makefile.PL
make
```

### Run tests

```bash
make test
# or run a single test file:
perl -Ilib t/webserver_dirindex.t
```

### Lint (Perl::Critic)

The CI pipeline runs `perlcritic` automatically. To run locally:

```bash
perlcritic lib/
```

## Dependencies

Runtime (declared in `Makefile.PL` under `PREREQ_PM`):

| Module | Purpose |
|---|---|
| `Feature::Compat::Class` | Modern `class`/`field`/`method` syntax |
| `Path::Tiny` | Filesystem path operations |
| `HTTP::Date` | Formatting file modification times |
| `Plack` | `Plack::MIME` for MIME type lookup; `Plack::Util::encode_html` for HTML escaping |
| `URI::Escape` | URI-escaping file names in URLs |

Test (declared under `TEST_REQUIRES`):

| Module | Purpose |
|---|---|
| `Test::More` | Standard Perl testing framework |
| `File::Temp` | Creating temporary directories in tests |

## CI / GitHub Actions

The workflow file is `.github/workflows/perltest.yml`. It delegates to shared
workflows from `PerlToolsTeam/github_workflows`:

- **build** (`cpan-test.yml`): runs `make test` across Perl 5.26–5.42.
- **coverage** (`cpan-coverage.yml`): runs `Devel::Cover` and uploads results.
- **perlcritic** (`cpan-perlcritic.yml`): static analysis with `Perl::Critic`.

If CI fails, check the job logs for which Perl version failed and whether it
is a test failure, coverage issue, or critic violation.

## Adding or Modifying Modules

1. Use `Feature::Compat::Class` class syntax (not Moose, Moo, or plain OO).
2. Update `Makefile.PL` if new runtime dependencies are added.
3. Add or update tests under `t/` using `Test::More`.
4. Add or update POD documentation inside the `.pm` file (after `__END__`).
5. Record changes in `Changes.md` following the Keep a Changelog format.
6. Keep the version string consistent across `Makefile.PL` and the `class`
   declaration in the affected `.pm` file.

## Known Issues / Workarounds

- The `Feature::Compat::Class` module requires Perl ≥ 5.14 but the modern
  `class` keyword behaviour differs slightly across older Perls. The CI matrix
  covers 5.26–5.42; do not lower `MIN_PERL_VERSION` below 5.14 without testing.
- `Plack::MIME->mime_type` is called with the full file path; it guesses the
  MIME type from the file extension. Files without a recognised extension fall
  back to `text/plain`.
