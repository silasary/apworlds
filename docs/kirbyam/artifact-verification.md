# Verify Kirby APWorld artifacts

Use the [release preparation runbook](release-preparation.md) for preflight, draft/tag ordering, readiness and recovery.

APWorlds contain executable Python code. Loading one trusts it with the Archipelago
process user's permissions. Obtain worlds from a distribution you trust and verify
its repository, reviewed source, workflow and bytes before installation. Test unfamiliar
plugins in a disposable isolated environment without personal files, unrelated tokens
or unnecessary network access. Provenance demonstrates origin, not freedom from bugs
or malicious behavior. An APWorld update does not repair host Python or OS trust stores.

## Source policy implemented for future releases

The builder records the artifact SHA-256, exact source commit, repository, ref, event,
workflow path and run/attempt in kirbyam.provenance.json. The staging publisher
checks this receipt against its GitHub context and the actual downloaded APWorld.
The receipt alone is not authenticated. The publisher attests both files with the
pinned GitHub provenance action and verifies their signatures and source/workflow
identity before uploading, then downloads and compares every staged asset byte for
byte and repeats verification. Signing rights exist only in the staging publisher,
which checks out trusted main, not tagged project code. No signing credentials are
created by this PR; no attestation or release operation runs in its fixture tests.

The action commit 977bb373ede98d70efdf65b84cb5f73e068dcc2a (v3.0.0) is a composite:
its predicate action is pinned to 864457a58d4733d7f1574bd8821fa24e02cf7538 and
its actions/attest dependency to daf44fb950173508f38bd2406030372c1d1162b1. Both use
bundled node24 JavaScript. GitHub OIDC/attestation services remain trusted online inputs.
The runner's gh CLI must support the verification flags below; failure stops staging.
This is source implementation, not evidence of a successfully signed public release.

## Draft assembly and owner review

An owner prepares an empty draft for the intended release tag; absent drafts fail
closed rather than treating an API failure as permission to create a release. Only
kirbyam.apworld, kirbyam.provenance.json and kirbyam.attestation.jsonl are permitted.
Full ROMs are forbidden. Unknown assets cause failure and are never deleted.
Existing identical assets are retained only when their API digest matches; changed
or missing digests fail for owner review. There is no clobber, delete, publish or edit
command. A rerun that produces a different attestation bundle will stop instead of
replacing it; the owner must review the existing verified draft, not erase evidence.
Rerunning only the publisher also fails the receipt run-attempt check; do not rewrite
the receipt to force it through. Review the existing run or rebuild the entire workflow.

One maintainer may perform all reviews. Protected tags, required environment reviewers
and GitHub immutable releases are optional safeguards, not staging prerequisites.
Existing restrictions remain enforced; no settings or credentials are changed here.
Keep the draft unpublished throughout staging. State is checked before each upload,
and per-tag concurrency serializes staging jobs, but API calls are not an atomic
transaction against manual publication. The owner must avoid concurrent edits and
wait for staging and verification to finish before separately authorizing publication.
Immutable releases, when enabled, provide stronger server-side enforcement. Without
them, verification establishes a snapshot only: assets and tags could later change.
Record the actual immutable status, preserve verification evidence and correct public
mistakes with a new version. Older releases without provenance are not retroactively
verified. The readiness command's optional strict profile still requires immutability.

## Consumer and post-publication verification

Use a current GitHub CLI with artifact-attestation verification. Independently obtain
the approved source SHA and tag from the reviewed release decision; do not copy them
only from the downloaded receipt. In a new empty directory, replace SOURCE and TAG:

```sh
set -eu
gh release download "$TAG" --repo hasherwi/Archipelago-kirbyam \
  --pattern kirbyam.apworld --pattern kirbyam.provenance.json --pattern kirbyam.attestation.jsonl
for artifact in kirbyam.apworld kirbyam.provenance.json; do
  gh attestation verify "$artifact" --repo hasherwi/Archipelago-kirbyam \
    --signer-workflow hasherwi/Archipelago-kirbyam/.github/workflows/kirbyam-apworld.yml \
    --source-digest "$SOURCE" --source-ref "refs/tags/$TAG" --deny-self-hosted-runners
done
sha256sum kirbyam.apworld
```

The online verifier checks current repository identity and signed source/workflow
claims; the downloaded bundle can be supplied with --bundle for offline verification,
but offline name checks cannot detect repository renaming/reuse. Compare the displayed
APWorld SHA-256 with the now-authenticated receipt. Inspect its event (`push`), workflow,
source, ref and run/attempt against the approved build. Stop on missing provenance,
wrong identity, changed bytes or any verification failure; do not fall back to filename
or unauthenticated checksums. Preserve the verification log and source decision.

After separately authorized publication, repeat these download/signature/digest checks
on the public asset in a new directory and record the release's immutable status.
No public release was made or checked by this PR. Live OIDC signing and
post-publication verification remain #983 acceptance gaps.
Do not claim immutable or atomic publication guarantees without separate evidence.
