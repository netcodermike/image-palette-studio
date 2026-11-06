# Validation

Authoring date: November 6, 2026. Host: Windows. Target: macOS desktop.

## Local result

Target-platform source CI is recorded after publication. This host has Python, Node.js, and .NET; other native toolchains are verified through CI. No unobserved GUI/device behavior is claimed.

## Reproducible checks

The GitHub Actions workflow builds/runs the following on `macos-latest`:

```sh
swift build -c release
swift run -c release LocalApp --self-test
```

## Manual acceptance

Choose a red/green test image, request 2 colors, and inspect the ranked hex values and frequencies. Compare a photo at 8 and 16 requested colors. Also test malformed inputs and an unwritable output destination.

A workflow file is not evidence of a passing run. Observed CI run links and source commits are recorded after publication. Native GUI, sound, sleep/resume, and platform permissions require direct target-platform acceptance even when model tests pass.

## Observed CI result

Passed: [target-platform build/check](https://github.com/netcodermike/image-palette-studio/actions/runs/42206242628). Source commit: `7b8be675c24ebcaec0f70ea3d8557a4d6448d59f`. Later documentation-only changes do not alter the tested implementation. The reproducible commands above identify test scope; native GUI/audio/permissions are not implied by compilation.
