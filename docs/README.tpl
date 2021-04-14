Empathy Helm Charts
===================

This repository is intended for sharing Helm Charts maintained by [Empathyco](https://www.empathy.co/).

We are open to contributors, you can contribute to Empathy Helm Charts through code, documentation or bug reports. More information about contributing can be found [here](CONTRIBUTING.md).

# Use this repo
```sh
$ helm repo add empathy-public https://empathyco.github.io/empathy-helm-charts
$ helm install --name my-release empathy/<chartName>
```
![helm-repo-add](docs/helm-repo-add.gif )

Here's the list complete list of supported Helm Charts:
{{"\n"}}
{{- range (file.ReadDir "/Users/marce/repos/helm-charts/charts") -}}
{{- if (file.IsDir "charts/{{strings.TrimSpace .}}") -}}
* {{ . }}{{"\n"}}
{{- end -}}
{{- end -}}
