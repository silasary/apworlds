# Prepare and verify a Kirby release

One maintainer can prepare, review and publish a release, with assistant help. No
second reviewer, new credential, tag-protection setup, or immutable-release setup is
required by this process. Existing repository and `kirbyam-release` environment
restrictions still apply. Do not bypass them or change security settings as a side
effect of a release. If a setting blocks the owner, review that exact change separately.

The short path is: **approve source → draft and tag → verify → approve publication**.
The same owner can make both decisions. Permission to prepare a draft or push a tag
is not permission to publish. Use existing maintainer access; never paste credentials
into an issue, release, evidence file or assistant conversation.

Use a reviewed checkout of main, Python 3.12, git and a current authenticated GitHub
CLI supporting attestation verification. The only release assets are
`kirbyam.apworld`, `kirbyam.provenance.json` and `kirbyam.attestation.jsonl`.
Never upload a full ROM, credentials or private runner details.

## v0.5.1 preparation in PR #1045

The source manifest and representative slot-data snapshot target `0.5.1`, with
release notes under `## v0.5.1` in `CHANGELOG.md`. Runtime slot data, generated
YAML requirements and packaged metadata derive their world version from the
manifest. APContainer and gameplay protocol versions are separate and unchanged.
This preparation does not create a tag, draft release or published release.

After PR #1045 is reviewed and merged, select the exact reviewed main commit as
SOURCE and use `kirbyam-v0.5.1` as TAG in the steps below. Do not use a PR build
or an uncommitted checkout as release provenance. Run source preflight against
that commit before any separately authorized draft/tag operation, then verify
the three attested assets before separately authorized publication.

For local packaging validation without rebuilding a ROM patch:

```sh
python worlds/kirbyam/build.py --skip-patch --skip-install --non-interactive
```

This checks packaging only. It reuses the committed patch and does not establish
live staging, signing, public delivery or emulator acceptance.

## 1. Approve the source and run preflight

Choose TAG and the full 40-character reviewed SOURCE independently of build outputs.
Confirm the owner authorizes preparing this exact release. Fetch main and tags; use
a full checkout, not a shallow one:

```sh
git fetch origin main --tags
python worlds/kirbyam/tools/release_readiness.py --preflight \
  --tag "$TAG" --source "$SOURCE"
```

Preflight checks main ancestry, the source manifest and release notes. It reads tagged
files as data, never runs tagged project code, and never repairs an inconsistent
manifest. It does not create a tag or release or prove that assets are ready.

For `kirbyam-v0.5.0-rc3`, notes prefer `## v0.5.0-rc3` and otherwise use `## v0.5.0`.
Final `kirbyam-v0.5.0` requires `## v0.5.0`. Another RC/version or `Unreleased` cannot
substitute; duplicate selected headings fail. Notes retain the source heading, while
the tag, prerelease flag, receipt and attestation identify the exact RC.

## 2. Create a draft, then push the tag

1. Inspect the remote tag and release. An existing object must be inspected, not
   overwritten. Distinguish an authenticated not-found response from unreadable state.
2. Create an **unpublished draft** with the reviewed notes and exact source:
   `gh release create "$TAG" --repo hasherwi/Archipelago-kirbyam --target "$SOURCE" --draft --title "$TAG" --notes-file reviewed-notes.md`
   Add `--prerelease` for an RC. Confirm its tag and `isDraft:true` with `gh release view`.
3. Check `git ls-remote origin "refs/tags/$TAG" "refs/tags/$TAG^{}"` again. If the
   tag exists, check its peeled commit and exact push run; do not replace it. Otherwise
   run `git tag "$TAG" "$SOURCE"` then `git push origin "refs/tags/$TAG:refs/tags/$TAG"`.
4. Confirm a KirbyAM APWorld run with event `push`, exact SOURCE, TAG and workflow
   `.github/workflows/kirbyam-apworld.yml`. Record its URL and attempt. A branch build
   or manual dispatch is build-only. Do not delete/recreate tags to trigger another run.
5. Wait for the staging job to finish. If an existing environment rule requests
   approval, follow that rule. This process does not require a separate reviewer or
   prevent the owner from reviewing their own release. Do not publish during staging.

Use existing maintainer git/CLI access. A workflow's GITHUB_TOKEN tag push does not
trigger another workflow. Do not create a broader token to work around that restriction.
The release UI's **Save draft** is also suitable, but saving a draft is not evidence
of a tag-push event. An empty public prerelease is never a fallback. If the available
integration lacks a needed operation, report that tool limitation and use an already
authorized supported route, or ask the owner for only the missing step.

## 3. Verify the draft, then obtain publication approval

```sh
python worlds/kirbyam/tools/release_readiness.py --tag "$TAG" --source "$SOURCE" \
  --run-id "$RUN_ID" > readiness.json
```

Nonzero exit means stop. `staged-and-verified` requires the exact tag-push run and a
successful staging job; exactly three allowlisted assets; matching API digests and
receipt run/attempt/source identity; and signed attestation verification of the
downloaded APWorld and receipt. API/auth/network failures fail closed. Build-only,
skipped, pending, awaiting-approval, failed and blocked states are not ready.

The command rechecks the peeled remote tag and release/asset state after verification,
ignoring only download counters. It never uploads or publishes. Per-tag workflow concurrency serializes
staging jobs, but cannot lock out another maintainer or UI/API operation. Keep a single
active release operator and do not publish or edit while staging/verification runs.

Review notes and RC classification, retain the source/run/digests and readiness JSON,
then obtain the owner's approval to publish this exact draft. Immediately before
publication, rerun readiness and confirm nothing changed. After authorized publication:

```sh
python worlds/kirbyam/tools/release_readiness.py --public \
  --tag "$TAG" --source "$SOURCE" --run-id "$RUN_ID" > public-readiness.json
```

This verifies **unauthenticated public downloads**, signatures, digests and identity.
`published-and-verified` means the downloaded snapshot passed; it does not promise
that mutable releases can never change. The report includes the server's `immutable`
value and warns when immutability is not verified. Missing provenance never passes.
Preserve the report and correct published mistakes with a new version, not replacement.

## Optional hardening, not a release prerequisite

Protected main/tags and GitHub immutable releases are useful extra safeguards, not a
requirement to find another maintainer. A release environment can be an audit record
without required reviewers; if owner self-approval is wanted, it must be permitted by
that environment's existing settings. This workflow keeps the environment declaration
so configured protections are not silently bypassed. No setting is changed here.

A team that wants the earlier strict profile can supply `--owner-evidence FILE` on
all three commands. The file must identify `repository`, `tag` and `source`, and contain
`protected_main`, `protected_tag`, `release_environment` and `immutable_releases`.
Each entry has `status` (`verified`, `missing` or `unreadable`). `verified` requires
`owner`, UTC `checked_at` and an `evidence` inspection reference/finding. In strict
mode, every entry must be verified; public verification also requires `immutable:true`.
This is an owner inspection record, not an automatic settings audit. Reinspect before
each attempt; API 403/404 or unavailable UI is unreadable. Do not commit private settings.
A separate reviewer and prevented self-review are optional choices even in this profile.

## Recovery without replacing evidence

| Observed state | Supported next action |
| --- | --- |
| Tag run starts before draft exists | Confirm the exact draft. If staging failed before any upload, inspect the original event and rerun the entire eligible workflow. |
| Draft exists, no tag/run | Push the exact tag using existing maintainer access; verify the actual event/run. Do not publish or dispatch to simulate it. |
| Publisher skipped | Inspect the build and the workflow at the tagged commit. Old tags still run old workflow gates. A merged policy change does not rewrite them; select a fresh version/source when no eligible original event exists. |
| Interrupted before any uploads | Inspect the original run and draft. A full-workflow rerun requires an eligible original tag push, unchanged source and current policy approval. |
| Partial uploads | Preserve all evidence. Existing bytes are retained only when identical with API digests. Reruns change receipt attempt and often attestation bytes; use a new version or separately approved recovery of original verified artifacts. |
| Publisher-only rerun | Receipt attempt mismatch is an expected refusal. Never edit receipts or fabricate provenance to force a pass. |
| Assets staged, verification interrupted | Run read-only readiness for the original successful attempt. A failed staging job still needs separately approved recovery. |
| Conflicting/missing digests, unknown assets or concurrent changes | Stop for owner review. Never delete, clobber or silently replace assets. |
| Published empty/partial release | Preserve public and incident evidence. Prefer a new version or separately approved recovery with explicit incomplete-provenance reporting. Manually attached bytes are not workflow-attested. |

## Live acceptance record

Offline fixtures and green build jobs do not establish live signing or public delivery.
Record owner source/preparation approval, reviewed SHA/tag, draft creation, actual tag
push actor/mechanism, run URL/attempt, any environment approval, staged readiness,
publication approval and public readiness with all three digests and immutable status.
The same owner may perform every review. Keep #1012/#982/#983 acceptance open until a
real rehearsal is recorded. Do not use the manually recovered v0.5.0-rc1 APWorld as
proof of this three-asset attested path.
