# Kirby build dependency boundary

This is partial coverage for #980, not a lock for an Archipelago installation.
The ROM smoke job uses CPython 3.12 on Linux x86_64 and bsdiff4 1.2.6, with
no wheel runtime dependencies. Its one selected wheel is SHA-256 locked, checked
against a complete filename inventory, then installed offline without dependency
resolution or source builds. Unexpected/missing wheels and altered bytes fail closed.
The interpreter, hosted runner image and apt ARM toolchain are not locked by this change.

The bsdiff4 filename and digest were obtained from the publisher's
https://pypi.org/pypi/bsdiff4/1.2.6/json release metadata. This establishes artifact
identity, not a malware review. Refresh in a separate reviewed PR: inspect upstream
changes and wheel METADATA/Requires-Dist, download the intended platform wheel,
compare SHA-256, update both lock files, and test the actual target interpreter.
New dependencies require a complete transitive inventory; never remove --no-deps
or --require-hashes to make resolution succeed. Never fall back to an sdist.

APWorld-only packaging (`build.py --skip-patch --skip-install`) uses the standard
library and the committed ROM patch. It does not need a Python package install.
The #979 security bootstrap locks pip/certifi separately; it does not lock later installs.

Remaining inventory/lock work: Kirby generation/flaky jobs install ci-requirements,
ModuleUpdate's root/world/WebHost requirements and setuptools. BizHawk smoke and
local hooks have their own inputs. Root setup.py/cx-Freeze, VCS KivyMD and its build
backends, global CI and other platforms are outside this Kirby-only change.
Do not claim these paths are reproducible. Python support and custom-world
compatibility remain unchanged; this wheel lock applies only to the named CI job.
