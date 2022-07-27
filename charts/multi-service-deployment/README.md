# multi-service-deployment

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.1](https://img.shields.io/badge/AppVersion-0.1.1-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Settings for affinity |
| autoscaling.enabled | bool | `false` |  |
| env | object | `{}` |  |
| extraenv | object | `{}` |  |
| fullnameOverride | string | `""` | Overrides the clusterName and nodeGroup when used in the naming of resources. This should only be used when using a single nodeGroup, otherwise you will have name conflicts |
| image.pullPolicy | string | `"IfNotPresent"` | The Kubernetes imagePullPolicy value |
| image.repository | string | `"test"` | Docker image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | Configuration for imagePullSecrets so that you can use a private registry for your image |
| ingress.enabled | bool | `false` | Enable Kubernetes Ingress to expose pods |
| ingresses | object | `{}` |  |
| keda.apiVersion | string | `"keda.sh/v1alpha1"` |  |
| keda.behavior | object | `{}` |  |
| keda.cooldownPeriod | int | `300` |  |
| keda.enabled | bool | `true` |  |
| keda.maxReplicas | int | `5` |  |
| keda.minReplicas | int | `1` |  |
| keda.pollingInterval | int | `30` |  |
| keda.restoreToOriginalReplicaCount | bool | `false` |  |
| keda.scaledObject.annotations | object | `{}` |  |
| keda.triggers | list | `[]` |  |
| livenessProbe | object | `{}` | Enable livenessProbe |
| maxUnavailable | int | `1` |  |
| metrics.enabled | bool | See values.yaml | Enable and configure a Prometheus serviceMonitor for the chart under this key. |
| metrics.prometheusRule | object | See values.yaml | Enable and configure Prometheus Rules for the chart under this key. |
| metrics.prometheusRule.alerting | object | `{"rules":[]}` | Configure additional alerting rules for the chart under this key |
| metrics.prometheusRule.recording | object | `{"rules":[]}` | Configure additional recording rules for the chart under this key |
| metrics.serviceMonitors | object | `{}` |  |
| minReadySeconds | int | `30` | Specifies the minimum number of seconds for which a newly created Pod should be ready without any of its containers crashing, for it to be considered available |
| nameOverride | string | `""` | Overrides the clusterName when used in the naming of resources |
| nodeSelector | object | `{}` | Configurable nodeSelector so that you can target specific nodes for your deployment |
| podAnnotations | object | `{}` | Configurable annotations applied to all pods |
| podLabels | object | `{}` | Configurable labels applied to all pods |
| podSecurityContext | object | `{}` | Allows you to set the securityContext for the pod |
| readinessProbe | object | `{}` | Enable readinessProbe |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"500m"` | CPU limits for the Deployment |
| resources.limits.memory | string | `"256Mi"` | Memory limits for the Deployment |
| resources.requests.cpu | string | `"1000m"` | CPU requests for the Deployment |
| resources.requests.memory | string | `"512Mi"` | Memory requests for the Deployment |
| revisionHistoryLimit | int | `3` | How many old ReplicaSets to maintain for the Deployment |
| securityContext | object | `{}` | Allows you to set the securityContext for the container |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| services[0].annotations | object | `{}` |  |
| services[0].labels | object | `{}` |  |
| services[0].name | string | `"example1"` |  |
| services[0].ports.name | string | `"http"` |  |
| services[0].ports.port | int | `80` |  |
| services[0].ports.protocol | string | `"TCP"` |  |
| services[0].ports.targetPort | int | `1000` |  |
| services[0].type | string | `"ClusterIP"` |  |
| services[1].name | string | `"example2"` |  |
| services[1].ports.name | string | `"http"` |  |
| services[1].ports.port | int | `90` |  |
| services[1].ports.protocol | string | `"TCP"` |  |
| services[1].ports.targetPort | int | `9090` |  |
| services[1].type | string | `"ClusterIP"` |  |
| startupProbe | object | `{}` | Enable startupProbe |
| strategy | object | `{"rollingUpdate":{"maxSurge":"25%","maxUnavailable":"25%"},"type":"RollingUpdate"}` | Specifies the strategy used to replace old Pods by new ones |
| terminationGracePeriodSeconds | int | `60` | TBD |
| tolerations | list | `[]` | Configurable tolerations |
| topologySpreadConstraints | list | `[]` | Instruct the kube-scheduler how to place each incoming Pod in relation to the existing Pods across your cluster |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
