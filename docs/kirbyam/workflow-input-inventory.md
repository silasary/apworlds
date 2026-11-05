# Kirby workflow executable inputs

Partial #981 coverage, restricted to `.github/workflows/kirby*.yml`.
The committed action-pins.json records exact commits resolved from upstream v6
(checkout/setup-python) and v4 (upload/download-artifact) on 2026-10-25.
Their action.yml entrypoints use bundled JavaScript (node24 for checkout/setup-python,
node20 for upload/download-artifact), with no composite nested `uses` entries.
The committed dist bundles are therefore covered by the Git commit identity;
this audit is not proof that those bundles are free of vulnerabilities.

Run `python worlds/kirbyam/tools/check_action_pins.py` before proposing changes.
Unknown actions, local actions, job/service containers, mutable tags and changed commits require
an explicit inventory review; the checker rejects them by default. Container and service
entries are disallowed until a future reviewed policy defines their complete input contract. Refresh a pin
only in a reviewed PR after inspecting upstream changes, action.yml and transitive
network/executable inputs. Never auto-resolve a tag during the workflow.

Remaining executable inputs: setup-python selects downloadable interpreter builds
from its release manifest; ubuntu-latest and self-hosted Windows are not immutable
images; apt installs ARM gcc/binutils/make; generation/flaky/BizHawk install Python
requirements. Pinning actions does not pin these inputs. The smoke runner's installed
BizHawk/runtime is owner-managed and its isolation has not been established here.
The vendored generation fuzzer's existing checksum remains unchanged.

Global LLVM, GoogleTest helper, Enemizer/SNI/VC redistributable, AppImage controls,
full-app container images and workflows are outside the owner's Kirby-only boundary.
No global checksum controls were relaxed. No claim of full #981 completion is made.

The #983 companion may add attest-build-provenance at
977bb373ede98d70efdf65b84cb5f73e068dcc2a (v3.0.0). This approved composite pins its
predicate action to 864457a58d4733d7f1574bd8821fa24e02cf7538 and actions/attest to
daf44fb950173508f38bd2406030372c1d1162b1; both nested manifests execute bundled
node24 JavaScript. Its online OIDC/attestation services remain trusted dependencies.
The pin is inventoried here so the companion cannot silently introduce a mutable action.
