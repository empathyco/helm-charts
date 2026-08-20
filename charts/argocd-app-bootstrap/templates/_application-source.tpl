{{- define "argocd-app-bootstrap.applicationSource" -}}
{{- /*
Renders the base source body (fields at relative indent 0) of an ArgoCD
Application entry. The caller passes a context dict with:
  app         -> the application entry (.Values.projects.<project>.applications[i])
  projectName -> the owning project key
  appName     -> the application name
  root        -> the chart root values ($.Values)
The caller embeds the result under `source:` (indent +4) or as the first item
of a `sources:` list (dash + indent +6).
*/ -}}
{{- $app := .app -}}
{{- $root := .root -}}
{{- if $app.isExternalApp }}
repoURL: "{{ $app.externalRepoURL }}"
targetRevision: "{{ $app.externalTargetRevision }}"
path: {{ $app.externalPath }}
helm:
  valueFiles:
{{- range $app.externalValuesFiles }}
    - {{ . }}
{{- end }}
{{- if $app.parameters }}
  parameters:
{{- $app.parameters | toYaml | nindent 4 }}
{{- end }}
{{- else }}
repoURL: "{{ $root.Values.repoURL }}"
targetRevision: "{{ $root.Values.targetRevision }}"
path: {{ $app.chartPath | default (printf "%s/applications/%s/%s" $root.Values.projectsRoot .projectName $app.name) }}
helm:
  valueFiles:
    - values.yaml
{{- range $app.extraValuesFiles }}
    - {{ . }}
{{- end }}
{{- if $app.parameters }}
  parameters:
{{- $app.parameters | toYaml | nindent 4 }}
{{- end }}
{{- end }}
{{- end }}
