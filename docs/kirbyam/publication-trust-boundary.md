# Kirby publication trust boundary

Use the [release preparation runbook](release-preparation.md). One maintainer can
approve the source, prepare the release, review the verified draft and authorize
publication. A separate reviewer is not required. Existing repository/environment
restrictions still apply; changing them is a separate owner decision.

## Implemented boundary

Build outputs do not authorize publication. The staging job requires this repository
and a `kirbyam-v*` tag-push event. It keeps the `kirbyam-release` environment so existing
approval/deployment restrictions are honored, without requiring them to be configured.
Tag protection is optional: it is no longer a condition for starting the staging job.

The staging checkout selects main, disables persisted credentials and executes main's
publisher policy. That policy checks repository/event/ref again, requires the tagged
commit in main history, reads its manifest/changelog as data and derives metadata
independently of build outputs. The manifest must already match; the writer cannot
repair versions or create PRs. Forks, branch builds and manual dispatches cannot stage.

Build/dependency jobs have read-only contents access and no signing rights. Only the
staging job has contents:write, id-token:write and attestations:write. The latter two
use GitHub's short-lived OIDC identity and provenance service; no personal token or
persistent signing credential is added. Action pins and disabled checkout credential
persistence remain unchanged. There is no pull-requests:write permission.

The publisher verifies exact bytes and provenance, allows only the APWorld, receipt
and attestation bundle, and adds missing assets only to an unpublished draft. It never
clobbers, deletes or publishes. Per-tag concurrency serializes staging jobs; it is not
a lock against manual publication or another API client. The owner must wait for staging
and verification to finish, then separately approve publication of that exact draft.

## Trust and optional safeguards

This is a single-maintainer process, not separation of duties. People who can change
main, workflow source, release tags or repository settings are trusted release operators.
A trusted-main script cannot defend against someone authorized to rewrite the workflow
that invokes it. Protected main/tags, environment reviewers and immutable releases can
reduce risk, but are optional additions and require separately approved settings changes.
No live setting or access permission is changed by this source update.

Retain the named environment even without reviewers. If it already requires another
person or blocks owner self-approval, follow that rule until the owner explicitly
approves an exact setting change. Do not remove the environment to bypass it.

Without server-side immutable releases, verification proves a snapshot, not that assets
or tags cannot later change. Preserve source/run/digests and public verification, avoid
concurrent release edits and correct public mistakes with a new version. Readiness
reports immutability separately; it never substitutes checksums for signed provenance.

## Remaining scope

The main-only self-hosted smoke job still has no persisted checkout credentials. Its
host/network isolation, ephemerality, runtime and cleanup remain unverified. The owner
must establish an isolated runner without unrelated credentials before treating it as
safe. Nothing here changes that runner or the global full-application release workflow.

Live OIDC signing, staging and public delivery remain acceptance work for #982/#983/#1012.
Tests are offline and never publish or change settings. Provenance proves origin, not
that executable APWorld code is harmless. The removed legacy prune/delete/clobber
publisher is not a supported fallback.
