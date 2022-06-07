{{/*
Expand the name of the chart.
*/}}
{{- define "devlake.name" -}}
{{- default .Chart.Name .Values.devlake.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "devlake.fullname" -}}
{{- if .Values.devlake.fullnameOverride }}
{{- .Values.devlake.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.devlake.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "devlake.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "devlake.labels" -}}
helm.sh/chart: {{ include "devlake.chart" . }}
{{ include "devlake.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "devlake.selectorLabels" -}}
app.kubernetes.io/name: {{ include "devlake.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "devlake.serviceAccountName" -}}
{{- if .Values.devlake.serviceAccount.create }}
{{- default (include "devlake.fullname" .) .Values.devlake.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.devlake.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "configui.fullname" -}}
{{- if .Values.configui.fullnameOverride }}
{{- .Values.configui.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default (printf "%s" "configui") .Values.configui.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "configui.labels" -}}
helm.sh/chart: {{ include "devlake.chart" . }}
{{ include "configui.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "configui.name" -}}
{{- default (printf "%s-%s" .Chart.Name "configui") .Values.configui.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "configui.selectorLabels" -}}
app.kubernetes.io/name: {{ include "configui.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "configui.serviceAccountName" -}}
{{- if .Values.configui.serviceAccount.create }}
{{- default (include "configui.fullname" .) .Values.configui.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.configui.serviceAccount.name }}
{{- end }}
{{- end }}



