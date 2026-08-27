# STATE.md — current state

> Rewritten, not appended, as the LAST act of every session. See `HISTORY.md`
> for the narrative.

## In flight

Nothing in flight as of 2026-08-27.

## Blocked

Nothing blocked. Zero open PRs.

## Current state

Latest known Go module tag: `sdk/go/v2.0.0` (verified directly via `gh api
repos/Ubiquex/ubx-sdk-aws/tags` — don't trust this file if it's gone stale,
re-check). npm (`@ubx/sdk-aws`) and PyPI (`ubx-sdk-aws`) versions are NOT
independently verified here — check `npmjs.com`/`pypi.org` directly before
assuming they match the Go tag.

`VERSION` at repo root: fetched 2026-08-25 from the real CloudFormation
registry schema zip.

## Before touching anything

- Never self-merge here. See `CLAUDE.md`.
- Never hand-edit generated bindings — fix the generator or the upstream
  schema, then regenerate.
- Go module path is `.../sdk/go/v2`, not `.../sdk/go` — don't assume the same
  import path shape as the other five SDK repos.
