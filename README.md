# Image Palette Studio

Extract a ranked, quantized color palette from a Mac image thumbnail.

[![Build and verify](https://github.com/netcodermike/image-palette-studio/actions/workflows/verify.yml/badge.svg)](https://github.com/netcodermike/image-palette-studio/actions/workflows/verify.yml)

**Language:** Swift · **Platform:** macOS desktop · **App type:** Mac dominant-color extraction app

First-release learning implementation, with explicit scope below. This is one independently runnable app, not a placeholder in a combined repository.

## Features

- Image picker
- 1–16 dominant colors
- 4-bit RGB buckets
- Thumbnail pixel frequencies

## Requirements

macOS 13+ and Xcode command-line tools supporting Swift 5.9+. No external packages.

## Quick start

```sh
git clone https://github.com/netcodermike/image-palette-studio.git
cd image-palette-studio
swift build
swift run LocalApp
```

Commands run from the repository root. Lines marked for a particular operating system apply only there. Language tools are prerequisites, not installed by the app. Close desktop windows normally; terminal/server apps stop with Ctrl+C unless their usage notes say otherwise.

## Example workflow

Choose a red/green test image, request 2 colors, and inspect the ranked hex values and frequencies. Compare a photo at 8 and 16 requested colors.

## Architecture, configuration, and data

App.swift uses ImageIO to decode a maximum-64-pixel-edge thumbnail, rasterizes into RGBA, skips pixels below alpha 128, and counts 4-bit-per-channel buckets. It sorts frequency descending with deterministic bucket ties and displays representative hex colors plus counts. Tests verify a synthetic red/green bucket ranking. No image file is changed or exported.

## Verification

Build with the quick-start command where needed, then run:

```sh
swift run LocalApp --self-test
```

Manual acceptance: Choose a red/green test image, request 2 colors, and inspect the ranked hex values and frequencies. Compare a photo at 8 and 16 requested colors. Also test malformed inputs and an unwritable output destination.

See [validation record](docs/VALIDATION.md) for observed checks and their limits. CI results verify only what the workflow runs; they do not establish native GUI correctness or production readiness.

## Limitations and next steps

Quantized frequency palette, not perceptual clustering or color-managed design extraction. Partially transparent pixels use premultiplied values; orientation/color profiles can affect sampling. No visual swatches, palette export, region selection, or batch processing. Runs synchronously.

## Troubleshooting

Use the exact platform/toolchain above. Preserve originals and use synthetic fixtures first. Errors are displayed in the UI or stderr. A headless machine can run the model tests but cannot verify native GUI/audio behavior. Output paths are chosen explicitly; keep backups of important data.

## Source map

- `Package.swift`
- `Sources/LocalApp/App.swift`

## Development and license

Read [contributing](CONTRIBUTING.md) before changing the app, and [security/privacy](SECURITY.md) before supplying private data. Use synthetic fixtures for tests. No telemetry, paid API key, or account is required by the app itself. Dependencies, when present, are stated in Requirements.

[MIT license](LICENSE), copyright 2026 netcodermike.
