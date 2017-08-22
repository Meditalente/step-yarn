# yarn step

Runs yarn install leveraging Wercker cache to allow much faster repeat installs.

If yarn is not installed before the step is ran yarn will be installed for you.

## Options

- `production` (optional, default `false`) If true passes `--prod` flag to yarn and does not install `devDependencies` or removes `devDependencies` after build
- `cache` (optional, default `true`) If true uses `$WERCKER_CACHE_DIR` to persist cache from previous runs of the pipeline and for future runs of the pipeline
- `options` (optional) Additional options to pass through to yarn, such as `--flat`

## Example

```yaml
build:
  steps:
    - yarn:
      name: install dependencies

    - script:
      name: build
      script: npm build   # Build here requires devDependencies

    - yarn:
      name: cleanup
      production: true    # Remove devDepdencies
```

## License

The MIT License (MIT)

## Changelog

2.0.4

- Use gloabl yarn if available

2.0.3

- Check if yarn already installed

2.0.2

- Small fix within installation process

2.0.1

- Small fix within installation process

2.0.0

- Switched to official installation guide https://yarnpkg.com/en/docs/install#linux-tab
- Removed version option

1.2.0

- Added version option

1.1.0

- Export yard bin path

1.0.0

- Initial release
