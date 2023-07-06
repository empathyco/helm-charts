# elasticsearch-deployment

![Version: 0.8.12](https://img.shields.io/badge/Version-0.8.12-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.17.2](https://img.shields.io/badge/AppVersion-7.17.2-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinityOverride | object | `{}` |  |
| antiAffinity | string | `"soft"` |  |
| antiAffinityTopologyKey | string | `"kubernetes.io/hostname"` |  |
| antiAffinityWeight | string | `""` |  |
| autoscaling.enabled | bool | `false` | Enable/Disable autoscaling for the StatefulSet |
| busybox.image | string | `"busybox:1.31"` | Image for busybox initContainers (sysctlInitContainer in official Elasticsearch Helm chart) |
| elastic_config | object | `{"bootstrap.memory_lock":"true","network.bind_host":"0.0.0.0","node.data":"false","node.ingest":"false","node.master":"false","node.ml":"false","transport.tcp.compress":"true"}` | Elasticsearch configuration added in a configMap and passed to the Elasticsearch pods as Env. Vars. |
| elastic_config."bootstrap.memory_lock" | string | `"true"` | Elasticsearch enable memory lock to avoid swapping |
| elastic_config."network.bind_host" | string | `"0.0.0.0"` | Elasticsearch network.bind_host, network address(es) to which the node should bind in order to listen for incoming connections. |
| elastic_config."node.data" | string | `"false"` | Elasticsearch data node role |
| elastic_config."node.ingest" | string | `"false"` | Elasticsearch ingest node role |
| elastic_config."node.master" | string | `"false"` | Elasticsearch master node role |
| elastic_config."node.ml" | string | `"false"` | Elasticsearch ml node role |
| elastic_config."transport.tcp.compress" | string | `"true"` | Elasticsearch enable compression between nodes |
| enabled | bool | `true` | Enabling or disabling master nodes |
| extraInitContainers | list | `[]` | Extra initContainers to be run after the ones needed by Elasticsearch |
| extraVolumeMounts | list | `[]` | Extra volume to mount to the Elasticsearch container. Those must be first specified in the extraVolumes field. |
| extraVolumes | list | `[]` | Extra volumes, these can be later mounted on the extraInitContainers or to the Elasticsearch container. |
| fullnameOverride | string | `""` | Overrides the clusterName and nodeGroup when used in the naming of resources. This should only be used when using a single nodeGroup, otherwise you will have name conflicts |
| image.pullPolicy | string | `"IfNotPresent"` | The Kubernetes imagePullPolicy value |
| image.repository | string | `"empathyco/elasticsearch"` | Docker repository for Elasticsearch image |
| image.tag | string | `"7.17.2-memlock"` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | Configuration for imagePullSecrets so that you can use a private registry for your image |
| ingress.annotations | object | `{}` | Annotations for Kubernetes Ingress |
| ingress.className | string | `""` | IngressClass name for ingress exposition |
| ingress.enabled | bool | `false` | Enable Kubernetes Ingress to expose Elasticsearch pods |
| ingress.hosts | list | `[]` | Host and path for Kubernetes Ingress. See values.yaml for an example |
| ingress.tls | list | `[]` | TLS secret for exposing Elasticsearch with https. See values.yaml for an example |
| initContainersResources | object | `{}` | Set up resources of default Elasticsearch initContainers (same for all) |
| nameOverride | string | `""` | Overrides the clusterName when used in the naming of resources |
| nodeAffinity | object | `{}` |  |
| nodeSelector | object | `{}` | Configurable nodeSelector so that you can target specific nodes for your Elasticsearch cluster |
| podAnnotations | object | `{}` | Configurable annotations applied to all Elasticsearch pods |
| podSecurityContext | object | `{}` | Allows you to set the securityContext for the pod |
| podSecurityPolicy.create | bool | `false` | Create a podSecurityPolicy with minimal permissions to run this Helm chart. Be sure to also set rbac.create to true, otherwise Role and RoleBinding won't be created. |
| podSecurityPolicy.name | string | `""` | The name of the podSecurityPolicy to use. If not set and create is true, a name is generated using the fullname template |
| podSecurityPolicy.spec | object | `{}` | Spec to apply to the podSecurityPolicy. See values.yaml for an example |
| priorityClassName | string | `""` |  |
| prometheus.command[0] | string | `"/bin/elasticsearch_exporter"` |  |
| prometheus.command[1] | string | `"--es.uri=http://127.0.0.1:9200"` |  |
| prometheus.dashboard | object | `{"enabled":true,"namespace":"monitoring"}` | Deploy a Grafana Dashboard |
| prometheus.enabled | bool | `true` | Deploy a ServiceMonitor for Prometheus scrapping |
| prometheus.exporter.image | string | `"prometheuscommunity/elasticsearch-exporter:v1.3.0"` | Exporter image to deploy as a sidecar container |
| rbac.create | bool | `false` | Whether RBAC rules should be created (Role and Rolebinding) |
| replicaCount | int | `3` | Kubernetes replica count for the Statefulset (i.e. how many pods) |
| resources.requests.cpu | string | `"1000m"` | CPU requests for the Deployment |
| resources.requests.memory | string | `"3Gi"` | Memory requests for the Deployment |
| securityContext | object | `{"capabilities":{"add":["IPC_LOCK","SYS_RESOURCE"]}}` | Allows you to set the securityContext for the container |
| service.port | int | `9200` | Kubernetes service port, used by Ingress to expose Elasticsearch pods |
| service.type | string | `"ClusterIP"` | Kubernetes service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Configurable tolerations |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
