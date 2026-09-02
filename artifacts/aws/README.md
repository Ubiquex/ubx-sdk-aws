# artifacts/aws

UBI-240 slice 6: the canonical home for this provider's own docs/codegen
artifacts, moved here from `ubiquex-docs`. See `ubx-sdk-kubernetes`'s
own `artifacts/kubernetes/README.md` for the full account of why this
moved (UBI-102's own comment thread) and how the four files divide.

- **`descriptions.json`** / **`intros.json`** / **`categories.json`** /
  **`exclusions.json`** — real source of truth, read by
  `ubx-docs-providers` at build time.
- **`aws.json`** — codegen-ready export (`{resource: {relPath: text}}`,
  qualifier-stripped, HTML-unescaped, `vendor-spec` entries included).
  What `ubx sdk gen --descriptions-dir artifacts/aws` actually reads.
  Never edited directly.

**Real, deliberate exception**: `--include-vendor-spec` is required
when regenerating this provider's own export. Confirmed (UBI-102): a
direct `--dump-ir` check with `--descriptions-dir` disabled found
11,954 of AWS's own vendor-spec-labeled fields come back with an empty
`DescriptionSource` -- `ubx-provider-dynamic`'s own CloudFormation/
Smithy translation does not natively carry this text the way the docs
corpus does, unlike every other provider. Omitting `--include-vendor-
spec` here would silently regress generated code comments for those
fields.

**Real, different history from most other providers**: `hash-watch.yml`
already applied this corpus correctly before this migration -- it
regenerates from the real central `sdk/providers/.ubx/config`
(`cd .../sdk/providers && ubx sdk gen ...`), which carried a real
`[dynamic_providers.aws.descriptions]` pin. This migration doesn't fix
a broken regen the way it did for kubernetes/github/digitalocean; it
removes the network/pin dependency and enables the "one commit, one
schema" principle. Verified live: a fresh regen against the migrated
local artifacts reproduces `sdk/go/aws/ecs/service.go` byte-for-byte
identical to what `hash-watch.yml`'s own pin-based regen already
produces.

To update: edit `descriptions.json` here, then regenerate `aws.json`
from a sibling `ubiquex-docs` checkout:

```bash
ubx sdk gen --only aws --dump-ir /tmp/dump --out /tmp/unused
cd ~/Ubiquex/ubiquex-docs/scripts/resource-reference-gen
python3 export_raw_descriptions.py aws AWS \
    --dump-root /tmp/dump/aws \
    --descriptions-path ~/Ubiquex/ubx-sdk-aws/artifacts/aws/descriptions.json \
    --nested-out ~/Ubiquex/ubx-sdk-aws/artifacts/aws/aws.json \
    --include-vendor-spec
```

Commit both files together.
