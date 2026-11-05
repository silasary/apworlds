# Python trust update for KirbyAM v0.5.0 planning

The [Python security notice of October 20, 2026](https://discuss.python.org/t/109576)
recommends pip >=26.2.2 and certifi >=2026.10.19 following the eMudhra/emSign CA incident.
The [certifi advisory](https://github.com/certifi/python-certifi/security/advisories/GHSA-6q48-6c7w-9gw2)
lists 2026.10.18 as patched; 2026.10.19 preserves unaffected roots.

## What this patch updates

Only KirbyAM-specific build/test workflows and this world's optional developer bootstrap are updated.
Global Archipelago dependency requirements, source setup, Docker builds, general CI and frozen-app
builders are unchanged. KirbyAM APWorld packaging itself uses the standard library and does not install
these packages or alter the host when the world is loaded. The bootstrap requirements contain
explicit wheel URLs and SHA-256 hashes verified against the Python notice and PyPI release metadata.
They install a known security baseline without asking an old pip to resolve packages from an index.

The release asset is an **APWorld only**. It contains Kirby's world/client code and guidance, but no
Python interpreter, pip, certifi bundle, or OS trust store. Installing the APWorld does not remediate
the Archipelago host. The trust-maintenance changes themselves do not change gameplay, generation logic, native payload or ROM patches; this is not a claim about the complete v0.5.0 integration.

## Dedicated KirbyAM development environments

This is an explicit maintenance step for a dedicated KirbyAM build/test virtual environment, not an
automatic host upgrade. From the source repository root, create and activate that environment first.
Do not run this command against system Python or an unrelated shared Archipelago environment:

```sh
python -m pip --isolated --disable-pip-version-check install --no-index --no-deps --require-hashes -r worlds/kirbyam/tools/security-bootstrap.txt
python -m pip --version
python -c "import certifi; import pip._vendor.certifi as vendor; print('certifi:', certifi.__version__, 'pip bundle:', vendor.__version__)"
```

The bootstrap installs pip 26.2.2 (vendored certifi 2026.10.19) and standalone certifi 2026.10.19.
It pins these versions, so running it on a newer environment selects this baseline; assess any later
security requirements before doing so. Keep TLS verification enabled. Stop if a hash or TLS check fails.
Do not use `--trusted-host`, disabled verification, or an unpinned `pip install --upgrade pip` as the
initial bootstrap. Normal dependency installation can follow a successful bootstrap.

New KirbyAM build/test venvs may contain older pip from ensurepip and need their own bootstrap.
Existing host environments require separate maintainer-approved remediation.
Updating standalone certifi does not update pip's vendored copy. Updating the OS store alone does not
remove pip's vendored roots. Conversely, package updates do not edit the OS store.

## Installed Archipelago and operating systems

For a frozen Archipelago executable, obtain a maintainer-confirmed updated runtime or use an updated
source environment. Do not assume running system pip changes an executable's embedded dependencies.
Confirm the exact interpreter and CA bundle used by each executable before calling it remediated.
The prior KirbyAM release also shipped only an APWorld; no frozen host runtime is supplied by this patch.

Follow your OS vendor's current guidance for the affected trust anchors. This patch makes no system
certificate or trust-setting changes. In managed environments, ask the administrator to verify the OS
store. Do not remove every emSign root: some are unaffected. Updating Python packages is not proof that
all system applications, containers or existing installations are safe, or that interception occurred.

Container and frozen-application maintenance remains outside this world patch. Their maintainers must
assess the Python notice, dependencies and final artifact CA bundles independently. No old binary or
cached image is retroactively updated by this patch.

## Python compatibility

Python 3.11 support is unchanged. The [upstream launcher report](https://github.com/ArchipelagoMW/Archipelago/issues/6506)
reproduces an import deadlock on 3.13.16. Python 3.13.17's embedded-pip security update is not evidence
that this launcher issue is fixed or reproduced there. Verify the chosen supported interpreter separately;
do not revert to an older insecure interpreter as a trust-remediation workaround.
