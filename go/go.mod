module github.com/ubiquex/ubx-sdk-aws/go

go 1.26.3

require github.com/ubiquex/ubx-sdk-go v0.0.0

// UBI-138: this module (root-level go/) is superseded by
// github.com/ubiquex/ubx-sdk-aws/sdk/go (the corrected sdk/go/typescript/python
// nesting, matching the real Pulumi precedent this project cites). Retracted,
// not deleted -- the Go module proxy/sumdb are immutable by design.
retract v0.3.0 // superseded by github.com/ubiquex/ubx-sdk-aws/sdk/go
