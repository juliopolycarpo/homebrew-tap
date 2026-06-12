# homebrew-tap

Shared [Homebrew](https://brew.sh) tap for [@juliopolycarpo](https://github.com/juliopolycarpo)
projects, on macOS and Linux.

## Usage

```bash
brew tap juliopolycarpo/tap
brew install mangostudio
```

Or in one step:

```bash
brew install juliopolycarpo/tap/mangostudio
```

## Formulas

| Formula       | Project                                                              | Description                                  |
| ------------- | -------------------------------------------------------------------- | -------------------------------------------- |
| `mangostudio` | [mangostudio](https://github.com/juliopolycarpo/mangostudio)          | AI-powered image generation and chat studio  |

## How this tap is maintained

Formulas in this repo are **generated — do not edit them by hand.**

This is a shared, multi-project tap: each project owns exactly one
`Formula/<name>.rb` and a release job that rewrites only that file on every tag
push, filling in the new version and per-platform `sha256` values from the
release's `SHA256SUMS`.

The reference implementation lives in
[mangostudio](https://github.com/juliopolycarpo/mangostudio):

- `scripts/release/update-homebrew.ts` — renders the formula from a template + `SHA256SUMS`
- `scripts/release/push-dist-repo.ts` — idempotent clone → copy-if-changed → commit → push-with-rebase-retry
- [`docs/reference/releasing.md`](https://github.com/juliopolycarpo/mangostudio/blob/main/docs/reference/releasing.md) — full pipeline docs

Future projects copy that pattern: add a new formula template + renderer in the
project repo and reuse `push-dist-repo.ts` with a different `--file` mapping.
The release workflow authenticates with a fine-grained PAT (`DIST_REPOS_TOKEN`)
scoped to contents read/write on this repo.
