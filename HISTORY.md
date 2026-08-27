# HISTORY.md — narrative archive

> Consulted only when a session needs to know why a decision was made, not on
> every open. For what's current, read `STATE.md` instead.

This file is new as of UBI-183 (2026-08-27). Real history predating it lives
in `ubiquex`'s own `HISTORY.md` (search `UBI-138`, `UBI-139`, `UBI-151`,
`UBI-185`, `UBI-186`, `UBI-189`) and in this repo's own real `git
log`/merged-PR history, which is authoritative for what actually shipped and
when.

## Real, known decisions worth carrying forward

**UBI-138/UBI-139: this repo's own real shape.** AWS was one of the four
original providers consolidated into one combined repo per provider,
carrying all three languages; the shared runtime code later moved out into
its own separate `ubx-sdk-go`/`ubx-sdk-typescript`/`ubx-sdk-python` repos so
it wasn't duplicated per provider.

**Real, live incident: this repo's own first real publish deleted a real
committed file.** All three registries (npm/PyPI/Go) came to agree at the
same version, but a real bug in the publish process's own verify step
deleted a real, previously-committed file along the way. Found, fixed,
restored — verify `git log` shows the restoration if working in the area a
publish touches, don't assume the current tree is complete without checking.
