# Prepare and verify a Kirby release

This is the supported maintainer entrypoint for #1012. It orchestrates the existing
#982/#983 controls; it does not authorize publication. Use a reviewed checkout of
main, Python 3.12, git, and a current authenticated GitHub CLI supporting attestation
verification. Never include a ROM, credentials, or private runner details in evidence.
The only assets allowed are `kirbyam.apworld`, `kirbyam.provenance.json`, and
`kirbyam.attestation.jsonl`.

## 1. Owner preflight, before any tag or release mutation

Choose TAG and the full 40-character reviewed SOURCE independently of build outputs.
Fetch main and tags using existing maintainer access. Do not use a shallow checkout.
The command checks ancestry against fetched origin/main and reads the source manifest
and changelog as data using the existing release metadata checks. It never runs tagged
project code and never repairs an inconsistent manifest.

An owner must inspect the current settings in
[publication-trust-boundary.md](publication-trust-boundary.md) and
[artifact-verification.md](artifact-verification.md). Record a fresh inspection for
this attempt in a local `owner-evidence.json` (do not commit private setting details):

```json
{
  "repository": "hasherwi/Archipelago-kirbyam",
  "tag": "kirbyam-v1.0.0-rc1",
  "source": "REPLACE_WITH_REVIEWED_40_CHARACTER_SHA",
  "protected_main": {"status": "unreadable"},
  "protected_tag": {"status": "unreadable"},
  "release_environment": {"status": "unreadable"},
  "immutable_releases": {"status": "unreadable"}
}
```

Each entry is `verified`, `missing`, or `unreadable`. Verified entries require `owner`,
`checked_at` (UTC time), and `evidence` (inspection URL plus concise finding). This is
an explicit owner inspection record, **not an automated settings audit** or proof
that an old record is still current. Reinspect immediately before each attempt and
publication. API 403/404, missing permissions, and unavailable UI are unreadable,
never verified. A historical release's immutable flag cannot establish future policy.

Verify main ancestry protection; active tag rules covering this exact tag with update
and deletion restrictions; `kirbyam-release` required reviewers, prevented self-review
and allowed protected tags; and server-side immutable future releases. Include
concurrent-publication enforcement in the immutable-policy evidence. If missing or
unreadable, stop: the repository owner must inspect/resolve the setting separately.
Do not change settings, add credentials, or remove the protected-ref gate to proceed.

```sh
git fetch origin main --tags
python worlds/kirbyam/tools/release_readiness.py --preflight \
  --tag "$TAG" --source "$SOURCE" --owner-evidence owner-evidence.json
```

Preflight success means source and recorded prerequisites passed. It does not mean a
tag, draft, eligible run or assets exist. The readiness phase below checks those.

## 2. Draft first, explicit tag push second

Use an existing maintainer identity allowed by the tag rules. Do not use a workflow's
GITHUB_TOKEN to push: its push events do not start another workflow. Do not broaden
credential scope or bypass environment approval to work around an unavailable tool.

1. Inspect the remote tag and release first. If either already exists, follow recovery
   below; do not overwrite or duplicate it. Distinguish an actual authenticated 404
   from an unreadable response.
2. Create an **unpublished draft** targeting SOURCE with the intended TAG. For example:
   `gh release create "$TAG" --repo hasherwi/Archipelago-kirbyam --target "$SOURCE" --draft --title "$TAG" --notes-file reviewed-notes.md`
   Add `--prerelease` for an RC. Inspect the draft with `gh release view` and confirm
   its tag and `isDraft:true`. Never rely on a publish button to materialize a tag.
3. Inspect `git ls-remote origin "refs/tags/$TAG" "refs/tags/$TAG^{}"` again. If a
   ref already exists, validate its peeled commit and inspect the exact push run;
   do not push a replacement. Otherwise create and push one lightweight tag explicitly:
   `git tag "$TAG" "$SOURCE"` then `git push origin "refs/tags/$TAG:refs/tags/$TAG"`.
   This normal maintainer git push is the intended workflow trigger. A draft API/UI
   call is not treated as proof of a push event.
4. Confirm the KirbyAM APWorld run exists with event `push`, exact SOURCE, tag TAG
   and workflow `.github/workflows/kirbyam-apworld.yml`. Record its run URL and attempt.
   No run means stop and inspect actor permissions/event delivery; manual dispatch
   and branch builds cannot stage. Never delete/recreate a protected tag to retrigger.
5. The environment reviewer checks the exact source/build before approving staging.
   Keep the draft unpublished until step 3 below succeeds.

If the integration cannot create a draft or tag, hand these exact steps to a maintainer
using their existing CLI access. The web release editor may **Save draft** for the
intended tag/source, but independent tag creation still uses git. If that UI cannot
save the draft, stop and use the CLI; an empty public prerelease is not a fallback.
See [GitHub CLI draft behavior](https://cli.github.com/manual/gh_release_create) and
[GitHub token trigger restrictions](https://docs.github.com/actions/using-workflows/triggering-a-workflow).

## 3. Readiness, then separate publication authorization

```sh
python worlds/kirbyam/tools/release_readiness.py --tag "$TAG" --source "$SOURCE" \
  --run-id "$RUN_ID" --owner-evidence owner-evidence.json > readiness.json
```

Nonzero exit means stop. Inspect the JSON, which includes SHA, tag, run/release URLs,
missing prerequisites/assets and an owner action. API/auth/network failures fail closed.
`build-only success`, `publisher skipped`, `awaiting approval`, `staging pending`,
`staging failed`, and `blocked` are not completion. While environment approval is
pending the final workflow summary has not run; the command reads pending deployments.
`build-only success` requires a successful overall run; `build-only` reports other
ineligible run outcomes. Neither can authorize staging.

`staged-and-verified` requires an exact matching tag-push run and successful publisher,
the three allowlisted assets, API digest matches, receipt run/attempt/source identity,
and #983 attestation verification of the downloaded APWorld and receipt. The command
rechecks release state and asset metadata after verification, ignoring only asset
download counters that verification can increment. It never uploads or publishes. This snapshot
is not an atomic lock: the owner must recheck current settings/state and enforce the
server-side immutable policy. Review notes/prerelease classification and retain the
readiness output before separately authorizing publication.

After separately authorized publication, repeat with `--public`. This invokes the
#983 receipt/digest/signature checks using **unauthenticated public asset downloads**
and additionally requires `immutable:true`; only then reports `published-and-verified`.
Missing provenance or immutable enforcement is incomplete verification, even when the
APWorld downloads. Preserve the output and link it from the release acceptance record.

## Recovery without replacing evidence

| Observed state | Supported next action |
| --- | --- |
| Tag run starts before draft exists | Create/confirm the exact unpublished draft. If the publisher has not reached staging, let it continue after approval. If it failed before uploading any assets, rerun the **entire** eligible tag-push workflow after confirming prerequisites. |
| Draft exists, no tag/run | Explicit maintainer tag push as above; verify actual event/run. Do not publish or dispatch to simulate a tag push. |
| Publisher skipped | Inspect build failure, event and tag protection. A rerun cannot turn a branch/manual event into a protected push, and old event protection context may remain false. Owner must resolve prerequisites and select a new coherent version when no eligible original event exists. |
| Interrupted attempt before any uploads | Inspect original run and draft. Full-workflow rerun is valid only for an originally eligible protected-tag push with unchanged source and verified settings. |
| Partial uploads | Preserve all files, digests, receipt and bundle. Existing bytes can only be retained when identical with API digests. Reruns change receipt run_attempt and usually attestation bytes; they are not a general resume mechanism. Use a new version or separately authorized, reviewed recovery of the original verified artifacts. |
| Publisher-only rerun | Receipt run_attempt differs from the current attempt; expected refusal. Never edit the receipt or fabricate a new provenance bundle. |
| All assets staged but verification interrupted | Run the read-only readiness check for the original successful attempt. If the publisher did not succeed, retain evidence and obtain separately approved recovery; do not claim automatic readiness. |
| Conflicting/missing digests, unknown asset, concurrent state change | Stop for owner review. Never delete, clobber or silently replace assets. |
| Accidentally published empty/partial release | Preserve public release and incident evidence. Standard staging refuses it. Prefer a corrected new version, or separately approved manual recovery with explicit incomplete-provenance reporting. Never pretend manually attached bytes were workflow-attested. |

## Live acceptance record (still required)

Offline fixtures and green build jobs do not complete #1012, #982 or #983. No live
rehearsal, release publication or settings change is authorized by this implementation.
An owner-approved rehearsal must record: approval reference; current settings evidence;
reviewed source SHA and tag; draft URL and creation-before-push evidence; actual tag
push actor/mechanism; run URL/attempt and environment approval; staged readiness JSON;
separate publication approval; public readiness JSON with immutable status and all
three asset digests. Record any incomplete signing, concurrency or public verification.
Keep the issues open until this evidence exists. Do not use the manually recovered
v0.5.0-rc1 APWorld as proof of the three-asset attested path.
