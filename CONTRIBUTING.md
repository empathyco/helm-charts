Empathy Helm Charts
===================

This repository is intended for sharing Helm Charts maintained by [Empathyco](https://www.empathy.co/).

You can contribute to Empathy Helm Charts through code, documentation or bug reports.

## Bug reports and Feature requests

For bug reports, make sure you:
- Give enough details regarding your setup, like:
  - Helm version you are using
  - What version of the Chart your are having issues with.
- Describe steps to reproduce the error, the error itself and expected behaviour

For feature requests, make sure you:
- Don't repeat yourself, first check if there's another issue already open for the same purpose.
- Give enough defails regarding the new feature and the Chart and Chart version the new feature should apply to.
- We are open to PR, so we are happy if you want to contribute and open a PR for your feature request.

## Pull requests

Before getting started on a pull request (be it a new feature or a bug fix), please open an issue explaning what you would like to achieve and how you would go about this.
Even though we are open to feature requests, we might not always agree on the value a feature might bring.

Once working on a pull request, please mind the following:
- Even though we support validating multiple Charts, we prefer one Chart per PR.
- Remember to update the `version` in the corresponding `Chart.yaml` file.
- There's a GitHub action that will lint all updated Charts and also validate that the new Chart version follows a valid semver.
- Once all automatic checks have passed, a maintainer will validate, comment, approve and merge the PR.
