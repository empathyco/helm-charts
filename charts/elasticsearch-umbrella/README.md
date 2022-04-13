# elasticsearch-umbrella

![Version: 0.8.0](https://img.shields.io/badge/Version-0.8.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.17.2](https://img.shields.io/badge/AppVersion-7.17.2-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
|  | client(elasticsearch-deployment) | 0.8.0 |
|  | master(elasticsearch-statefulset) | 0.8.0 |
|  | data(elasticsearch-statefulset) | 0.8.0 |
|  | index(elasticsearch-statefulset) | 0.8.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| client.busybox.image | string | `"busybox:1.31"` | Image for busybox initContainers (sysctlInitContainer in official Elasticsearch Helm chart) |
| client.elastic_config | object | `{"ES_JAVA_OPTS":"-Xms2048m -Xmx2048m","bootstrap.memory_lock":"true","logger.org.elasticsearch.discovery.gce":"TRACE","network.bind_host":"0.0.0.0","node.data":"false","node.master":"false","node.ml":"false","transport.tcp.compress":"true"}` | Elasticsearch configuration added in a configMap and passed to the Elasticsearch pods as Env. Vars. |
| client.elastic_config."bootstrap.memory_lock" | string | `"true"` | Elasticsearch enable memory lock to avoid swapping |
| client.elastic_config."logger.org.elasticsearch.discovery.gce" | string | `"TRACE"` | Elasticsearch GCE discovery log level |
| client.elastic_config."network.bind_host" | string | `"0.0.0.0"` | Elasticsearch network.bind_host, network address(es) to which the node should bind in order to listen for incoming connections. |
| client.elastic_config."node.data" | string | `"false"` | Elasticsearch data node role |
| client.elastic_config."node.master" | string | `"false"` | Elasticsearch master node role |
| client.elastic_config."node.ml" | string | `"false"` | Elasticsearch ml node role |
| client.elastic_config."transport.tcp.compress" | string | `"true"` | Elasticsearch enable compression between nodes |
| client.elastic_config.ES_JAVA_OPTS | string | `"-Xms2048m -Xmx2048m"` | Elasticsearch JVM options |
| client.enabled | bool | `true` | Enabling or disabling client nodes |
| client.fullnameOverride | string | `""` | Overrides the clusterName and nodeGroup when used in the naming of resources. This should only be used when using a single nodeGroup, otherwise you will have name conflicts |
| client.image.pullPolicy | string | `"IfNotPresent"` | The Kubernetes imagePullPolicy value |
| client.image.repository | string | `"empathyco/elasticsearch"` | Docker repository for Elasticsearch image |
| client.image.tag | string | `"7.17.2-memlock"` | Overrides the image tag whose default is the chart appVersion. |
| client.imagePullSecrets | list | `[]` | Configuration for imagePullSecrets so that you can use a private registry for your image |
| client.ingress.annotations | object | `{}` | Annotations for Kubernetes Ingress |
| client.ingress.className | string | `""` | IngressClass name for ingress exposition |
| client.ingress.enabled | bool | `false` | Enable Kubernetes Ingress to expose Elasticsearch pods |
| client.ingress.hosts | list | `[]` | Host and path for Kubernetes Ingress. See values.yaml for an example |
| client.ingress.tls | list | `[]` | TLS secret for exposing Elasticsearch with https. See values.yaml for an example |
| client.nameOverride | string | `""` | Overrides the clusterName when used in the naming of resources |
| client.nodeSelector | object | `{}` | Configurable nodeSelector so that you can target specific nodes for your Elasticsearch cluster |
| client.podAnnotations | object | `{}` | Configurable annotations applied to all Elasticsearch pods |
| client.podSecurityContext | object | `{}` | Allows you to set the securityContext for the pod |
| client.podSecurityPolicy.create | bool | `false` | Create a podSecurityPolicy with minimal permissions to run this Helm chart. Be sure to also set rbac.create to true, otherwise Role and RoleBinding won't be created. |
| client.podSecurityPolicy.name | string | `""` | The name of the podSecurityPolicy to use. If not set and create is true, a name is generated using the fullname template |
| client.podSecurityPolicy.spec | object | `{}` | Spec to apply to the podSecurityPolicy. See values.yaml for an example |
| client.prometheus.annotations | object | `{"app":"prometheus-operator","release":"prometheus"}` | Annotations to include in the ServiceMonitor |
| client.prometheus.enabled | bool | `false` | Deploy a ServiceMonitor for Prometheus scrapping |
| client.prometheus.exporter.image | string | `"justwatch/elasticsearch_exporter:1.1.0"` | Exporter image to deploy as a sidecar container |
| client.prometheus.resources.limits.cpu | string | `"100m"` |  |
| client.prometheus.resources.limits.memory | string | `"128Mi"` |  |
| client.prometheus.resources.requests.cpu | string | `"100m"` |  |
| client.prometheus.resources.requests.memory | string | `"128Mi"` |  |
| client.rbac.create | bool | `false` | Whether RBAC rules should be created (Role and Rolebinding) |
| client.replicaCount | int | `3` | Kubernetes replica count for the Deployment (i.e. how many pods) |
| client.resources.limits.cpu | string | `"1000m"` | CPU limits for the StatefulSet |
| client.resources.limits.memory | string | `"3Gi"` | Memory limits for the StatefulSet |
| client.resources.requests.cpu | string | `"1000m"` | CPU requests for the StatefulSet |
| client.resources.requests.memory | string | `"3Gi"` | Memory requests for the StatefulSet |
| client.securityContext | object | `{"capabilities":{"add":["IPC_LOCK","SYS_RESOURCE"]}}` | Allows you to set the securityContext for the container |
| client.service.port | int | `9200` | Kubernetes service port, used by Ingress to expose Elasticsearch pods |
| client.service.type | string | `"ClusterIP"` | Kubernetes service type |
| client.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| client.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| client.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| client.tolerations | list | `[]` | Configurable tolerations |
| data.busybox.image | string | `"busybox:1.31"` | Image for busybox initContainers (sysctlInitContainer in official Elasticsearch Helm chart) |
| data.elastic_config | object | `{"ES_JAVA_OPTS":"-Xms2048m -Xmx2048m","bootstrap.memory_lock":"true","logger.org.elasticsearch.discovery.gce":"TRACE","network.bind_host":"0.0.0.0","node.attr.type":"search","node.data":"true","node.ingest":"true","node.master":"false","node.ml":"false","transport.tcp.compress":"true"}` | Elasticsearch configuration added in a configMap and passed to the Elasticsearch pods as Env. Vars. |
| data.elastic_config."bootstrap.memory_lock" | string | `"true"` | Elasticsearch enable memory lock to avoid swapping |
| data.elastic_config."logger.org.elasticsearch.discovery.gce" | string | `"TRACE"` | Elasticsearch GCE discovery log level |
| data.elastic_config."network.bind_host" | string | `"0.0.0.0"` | Elasticsearch network.bind_host, network address(es) to which the node should bind in order to listen for incoming connections. |
| data.elastic_config."node.attr.type" | string | `"search"` | Elasticsearch node attribute type |
| data.elastic_config."node.data" | string | `"true"` | Elasticsearch data node role |
| data.elastic_config."node.ingest" | string | `"true"` | Elasticsearch ingest node role |
| data.elastic_config."node.master" | string | `"false"` | Elasticsearch master node role |
| data.elastic_config."node.ml" | string | `"false"` | Elasticsearch ml node role |
| data.elastic_config."transport.tcp.compress" | string | `"true"` | Elasticsearch enable compression between nodes |
| data.elastic_config.ES_JAVA_OPTS | string | `"-Xms2048m -Xmx2048m"` | Elasticsearch JVM options |
| data.enabled | bool | `true` | Enabling or disabling data nodes |
| data.fullnameOverride | string | `""` | Overrides the clusterName and nodeGroup when used in the naming of resources. This should only be used when using a single nodeGroup, otherwise you will have name conflicts |
| data.image.pullPolicy | string | `"IfNotPresent"` | The Kubernetes imagePullPolicy value |
| data.image.repository | string | `"empathyco/elasticsearch"` | Docker repository for Elasticsearch image |
| data.image.tag | string | `"7.17.2-memlock"` | Overrides the image tag whose default is the chart appVersion. |
| data.imagePullSecrets | list | `[]` | Configuration for imagePullSecrets so that you can use a private registry for your image |
| data.ingress.annotations | object | `{}` | Annotations for Kubernetes Ingress |
| data.ingress.className | string | `""` | IngressClass name for ingress exposition |
| data.ingress.enabled | bool | `false` | Enable Kubernetes Ingress to expose Elasticsearch pods |
| data.ingress.hosts | list | `[]` | Host and path for Kubernetes Ingress. See values.yaml for an example |
| data.ingress.tls | list | `[]` | TLS secret for exposing Elasticsearch with https. See values.yaml for an example |
| data.isMaster | bool | `false` | This property indicates its the master |
| data.nameOverride | string | `""` | Overrides the clusterName when used in the naming of resources |
| data.nodeSelector | object | `{}` | Configurable nodeSelector so that you can target specific nodes for your Elasticsearch cluster |
| data.podAnnotations | object | `{}` | Configurable annotations applied to all Elasticsearch pods |
| data.podSecurityContext | object | `{}` | Allows you to set the securityContext for the pod |
| data.podSecurityPolicy.create | bool | `false` | Create a podSecurityPolicy with minimal permissions to run this Helm chart. Be sure to also set rbac.create to true, otherwise Role and RoleBinding won't be created. |
| data.podSecurityPolicy.name | string | `""` | The name of the podSecurityPolicy to use. If not set and create is true, a name is generated using the fullname template |
| data.podSecurityPolicy.spec | object | `{}` | Spec to apply to the podSecurityPolicy. See values.yaml for an example |
| data.prometheus.annotations | object | `{"app":"prometheus-operator","release":"prometheus"}` | Annotations to include in the ServiceMonitor |
| data.prometheus.enabled | bool | `false` | Deploy a ServiceMonitor for Prometheus scrapping |
| data.prometheus.exporter.image | string | `"justwatch/elasticsearch_exporter:1.1.0"` | Exporter image to deploy as a sidecar container |
| data.prometheus.resources.limits.cpu | string | `"100m"` |  |
| data.prometheus.resources.limits.memory | string | `"128Mi"` |  |
| data.prometheus.resources.requests.cpu | string | `"100m"` |  |
| data.prometheus.resources.requests.memory | string | `"128Mi"` |  |
| data.rbac.create | bool | `false` | Whether RBAC rules should be created (Role and Rolebinding) |
| data.replicaCount | int | `3` | Kubernetes replica count for the StatefulSet (i.e. how many pods) |
| data.resources.limits.cpu | string | `"1000m"` | CPU limits for the StatefulSet |
| data.resources.limits.memory | string | `"3Gi"` | Memory limits for the StatefulSet |
| data.resources.requests.cpu | string | `"1000m"` | CPU requests for the StatefulSet |
| data.resources.requests.memory | string | `"3Gi"` | Memory requests for the StatefulSet |
| data.securityContext | object | `{"capabilities":{"add":["IPC_LOCK","SYS_RESOURCE"]}}` | Allows you to set the securityContext for the container |
| data.service.port | int | `9200` | Kubernetes service port, used by Ingress to expose Elasticsearch pods |
| data.service.type | string | `"ClusterIP"` | Kubernetes service type |
| data.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| data.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| data.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| data.tolerations | list | `[]` | Configurable tolerations |
| data.volume.annotations | object | `{}` | Annotations for statefulSet volumes |
| data.volume.storage | string | `"200Gi"` | Storage resources for statefulSet volumes |
| data.volume.storage_class | string | `"standard"` | Storage class for statefulSet volumes |
| global.elastic_config."cluster.name" | string | `"es"` | Elasticsearch cluster.name and should be unique per cluster in the namespace. Note that it should be the same as elasticsearch-data.elastic_config."cluster.name" so both subcharts belong to the same cluster. |
| global.masterFullname | string | `"es-master"` | Fullname of the master, necessary to connect |
| index.busybox.image | string | `"busybox:1.31"` | Image for busybox initContainers (sysctlInitContainer in official Elasticsearch Helm chart) |
| index.elastic_config | object | `{"ES_JAVA_OPTS":"-Xms2048m -Xmx2048m","bootstrap.memory_lock":"true","logger.org.elasticsearch.discovery.gce":"TRACE","network.bind_host":"0.0.0.0","node.attr.type":"index","node.data":"true","node.ingest":"true","node.master":"false","node.ml":"false","transport.tcp.compress":"true"}` | Elasticsearch configuration added in a configMap and passed to the Elasticsearch pods as Env. Vars. |
| index.elastic_config."bootstrap.memory_lock" | string | `"true"` | Elasticsearch enable memory lock to avoid swapping |
| index.elastic_config."logger.org.elasticsearch.discovery.gce" | string | `"TRACE"` | Elasticsearch GCE discovery log level |
| index.elastic_config."network.bind_host" | string | `"0.0.0.0"` | Elasticsearch network.bind_host, network address(es) to which the node should bind in order to listen for incoming connections. |
| index.elastic_config."node.attr.type" | string | `"index"` | Elasticsearch node attribute type |
| index.elastic_config."node.data" | string | `"true"` | Elasticsearch data node role |
| index.elastic_config."node.ingest" | string | `"true"` | Elasticsearch ingest node role |
| index.elastic_config."node.master" | string | `"false"` | Elasticsearch master node role |
| index.elastic_config."node.ml" | string | `"false"` | Elasticsearch ml node role |
| index.elastic_config."transport.tcp.compress" | string | `"true"` | Elasticsearch enable compression between nodes |
| index.elastic_config.ES_JAVA_OPTS | string | `"-Xms2048m -Xmx2048m"` | Elasticsearch JVM options |
| index.enabled | bool | `true` | Enabling or disabling index nodes |
| index.fullnameOverride | string | `""` | Overrides the clusterName and nodeGroup when used in the naming of resources. This should only be used when using a single nodeGroup, otherwise you will have name conflicts |
| index.image.pullPolicy | string | `"IfNotPresent"` | The Kubernetes imagePullPolicy value |
| index.image.repository | string | `"empathyco/elasticsearch"` | Docker repository for Elasticsearch image |
| index.image.tag | string | `"7.17.2-memlock"` | Overrides the image tag whose default is the chart appVersion. |
| index.imagePullSecrets | list | `[]` | Configuration for imagePullSecrets so that you can use a private registry for your image |
| index.ingress.annotations | object | `{}` | Annotations for Kubernetes Ingress |
| index.ingress.className | string | `""` | IngressClass name for ingress exposition |
| index.ingress.enabled | bool | `false` | Enable Kubernetes Ingress to expose Elasticsearch pods |
| index.ingress.hosts | list | `[]` | Host and path for Kubernetes Ingress. See values.yaml for an example |
| index.ingress.tls | list | `[]` | TLS secret for exposing Elasticsearch with https. See values.yaml for an example |
| index.isMaster | bool | `false` | This property indicates its the master |
| index.nameOverride | string | `""` | Overrides the clusterName when used in the naming of resources |
| index.nodeSelector | object | `{}` | Configurable nodeSelector so that you can target specific nodes for your Elasticsearch cluster |
| index.podAnnotations | object | `{}` | Configurable annotations applied to all Elasticsearch pods |
| index.podSecurityContext | object | `{}` | Allows you to set the securityContext for the pod |
| index.podSecurityPolicy.create | bool | `false` | Create a podSecurityPolicy with minimal permissions to run this Helm chart. Be sure to also set rbac.create to true, otherwise Role and RoleBinding won't be created. |
| index.podSecurityPolicy.name | string | `""` | The name of the podSecurityPolicy to use. If not set and create is true, a name is generated using the fullname template |
| index.podSecurityPolicy.spec | object | `{}` | Spec to apply to the podSecurityPolicy. See values.yaml for an example |
| index.prometheus.annotations | object | `{"app":"prometheus-operator","release":"prometheus"}` | Annotations to include in the ServiceMonitor |
| index.prometheus.enabled | bool | `false` | Deploy a ServiceMonitor for Prometheus scrapping |
| index.prometheus.exporter.image | string | `"justwatch/elasticsearch_exporter:1.1.0"` | Exporter image to deploy as a sidecar container |
| index.prometheus.resources.limits.cpu | string | `"100m"` |  |
| index.prometheus.resources.limits.memory | string | `"128Mi"` |  |
| index.prometheus.resources.requests.cpu | string | `"100m"` |  |
| index.prometheus.resources.requests.memory | string | `"128Mi"` |  |
| index.rbac.create | bool | `false` | Whether RBAC rules should be created (Role and Rolebinding) |
| index.replicaCount | int | `1` | Kubernetes replica count for the StatefulSet (i.e. how many pods) |
| index.resources.limits.cpu | string | `"1000m"` | CPU limits for the StatefulSet |
| index.resources.limits.memory | string | `"3Gi"` | Memory limits for the StatefulSet |
| index.resources.requests.cpu | string | `"1000m"` | CPU requests for the StatefulSet |
| index.resources.requests.memory | string | `"3Gi"` | Memory requests for the StatefulSet |
| index.securityContext | object | `{"capabilities":{"add":["IPC_LOCK","SYS_RESOURCE"]}}` | Allows you to set the securityContext for the container |
| index.service.port | int | `9200` | Kubernetes service port, used by Ingress to expose Elasticsearch pods |
| index.service.type | string | `"ClusterIP"` | Kubernetes service type |
| index.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| index.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| index.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| index.tolerations | list | `[]` | Configurable tolerations |
| index.volume.annotations | object | `{}` | Annotations for statefulSet volumes |
| index.volume.storage | string | `"200Gi"` | Storage resources for statefulSet volumes |
| index.volume.storage_class | string | `"standard"` | Storage class for statefulSet volumes |
| master.busybox.image | string | `"busybox:1.31"` | Image for busybox initContainers (sysctlInitContainer in official Elasticsearch Helm chart) |
| master.elastic_config | object | `{"ES_JAVA_OPTS":"-Xms2048m -Xmx2048m","bootstrap.memory_lock":"true","discovery.zen.minimum_master_nodes":"1","network.bind_host":"0.0.0.0","node.data":"false","node.ingest":"false","node.master":"true","node.ml":"false","transport.tcp.compress":"true"}` | Elasticsearch configuration added in a configMap and passed to the Elasticsearch pods as Env. Vars. |
| master.elastic_config."bootstrap.memory_lock" | string | `"true"` | Elasticsearch enable memory lock to avoid swapping |
| master.elastic_config."discovery.zen.minimum_master_nodes" | string | `"1"` | Minimum number of master eligible nodes that need to join a newly elected master in order for an election to complete and for the elected node to accept its mastership. |
| master.elastic_config."network.bind_host" | string | `"0.0.0.0"` | Elasticsearch network.bind_host, network address(es) to which the node should bind in order to listen for incoming connections. |
| master.elastic_config."node.data" | string | `"false"` | Elasticsearch data node role |
| master.elastic_config."node.ingest" | string | `"false"` | Elasticsearch ingest node role |
| master.elastic_config."node.master" | string | `"true"` | Elasticsearch master node role |
| master.elastic_config."node.ml" | string | `"false"` | Elasticsearch ml node role |
| master.elastic_config."transport.tcp.compress" | string | `"true"` | Elasticsearch enable compression between nodes |
| master.elastic_config.ES_JAVA_OPTS | string | `"-Xms2048m -Xmx2048m"` | Elasticsearch JVM options |
| master.enabled | bool | `true` | Enabling or disabling master nodes |
| master.fullnameOverride | string | `""` | Overrides the clusterName and nodeGroup when used in the naming of resources. This should only be used when using a single nodeGroup, otherwise you will have name conflicts |
| master.image.pullPolicy | string | `"IfNotPresent"` | The Kubernetes imagePullPolicy value |
| master.image.repository | string | `"empathyco/elasticsearch"` | Docker repository for Elasticsearch image |
| master.image.tag | string | `"7.17.2-memlock"` | Overrides the image tag whose default is the chart appVersion. |
| master.imagePullSecrets | list | `[]` | Configuration for imagePullSecrets so that you can use a private registry for your image |
| master.ingress.annotations | object | `{}` | Annotations for Kubernetes Ingress |
| master.ingress.className | string | `""` | IngressClass name for ingress exposition |
| master.ingress.enabled | bool | `false` | Enable Kubernetes Ingress to expose Elasticsearch pods |
| master.ingress.hosts | list | `[]` | Host and path for Kubernetes Ingress. See values.yaml for an example |
| master.ingress.tls | list | `[]` | TLS secret for exposing Elasticsearch with https. See values.yaml for an example |
| master.isMaster | bool | `true` | This property indicates its the master |
| master.nameOverride | string | `""` | Overrides the clusterName when used in the naming of resources |
| master.nodeSelector | object | `{}` | Configurable nodeSelector so that you can target specific nodes for your Elasticsearch cluster |
| master.podAnnotations | object | `{}` | Configurable annotations applied to all Elasticsearch pods |
| master.podSecurityContext | object | `{}` | Allows you to set the securityContext for the pod |
| master.podSecurityPolicy.create | bool | `false` | Create a podSecurityPolicy with minimal permissions to run this Helm chart. Be sure to also set rbac.create to true, otherwise Role and RoleBinding won't be created. |
| master.podSecurityPolicy.name | string | `""` | The name of the podSecurityPolicy to use. If not set and create is true, a name is generated using the fullname template |
| master.podSecurityPolicy.spec | object | `{}` | Spec to apply to the podSecurityPolicy. See values.yaml for an example |
| master.prometheus.annotations | object | `{"app":"prometheus-operator","release":"prometheus"}` | Annotations to include in the ServiceMonitor |
| master.prometheus.dashboard.enabled | bool | `true` |  |
| master.prometheus.dashboard.namespace | string | `"monitoring"` |  |
| master.prometheus.enabled | bool | `false` | Deploy a ServiceMonitor for Prometheus scrapping |
| master.prometheus.exporter.image | string | `"justwatch/elasticsearch_exporter:1.1.0"` | Exporter image to deploy as a sidecar container |
| master.prometheus.resources | object | `{"limits":{"cpu":"100m","memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}` | Deploy a Grafana Dashboard |
| master.rbac.create | bool | `false` | Whether RBAC rules should be created (Role and Rolebinding) |
| master.replicaCount | int | `3` | Kubernetes replica count for the Statefulset (i.e. how many pods) |
| master.resources.limits.cpu | string | `"1000m"` | CPU limits for the Deployment |
| master.resources.limits.memory | string | `"3Gi"` | Memory limits for the Deployment |
| master.resources.requests.cpu | string | `"1000m"` | CPU requests for the Deployment |
| master.resources.requests.memory | string | `"3Gi"` | Memory requests for the Deployment |
| master.securityContext | object | `{"capabilities":{"add":["IPC_LOCK","SYS_RESOURCE"]}}` | Allows you to set the securityContext for the container |
| master.service.port | int | `9200` | Kubernetes service port, used by Ingress to expose Elasticsearch pods |
| master.service.type | string | `"ClusterIP"` | Kubernetes service type |
| master.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| master.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| master.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| master.tolerations | list | `[]` | Configurable tolerations |
| master.volume.annotations | object | `{}` | Annotations for statefulSet volumes |
| master.volume.storage | string | `"5Gi"` | Storage resources for statefulSet volumes |
| master.volume.storage_class | string | `"standard"` | Storage class for statefulSet volumes |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
