# Elasticsearch-umbrella

This Helm chart is Empathy's own Helm chart (based on the official [Elasticsearch Helm chart](https://github.com/elastic/helm-charts/tree/master/elasticsearch)) to deploy an Elasticsearch 6.6.2 with a custom Dockerfile habilitating unlimited memory lock (`ulimit -l unlimited`). Additionally, [justwatchcom Elasticsearh Exporter](https://github.com/justwatchcom/elasticsearch_exporter) is deployed as a sidecar container to expose Prometheus metrics in port `9114`.

**N.B.** Please note this Helm chart is an umbrella chart for Empathy's [Elasticsearch-master Helm chart](../elasticsearch-master) and [Elasticsearch-data Helm chart](../elasticsearch-data)

## Requirements

- Kubernetes >= 1.14
- [Helm](https://helm.sh/) 3
- Minimum cluster requirements include the following to run this chart with default settings.
	- Three Kubernetes nodes to respect the `topologyKey: "kubernetes.io/hostname"` antiaffinity.
	- 3GB of RAM for the JVM heap.
	- 1 vCPU available for resource limits.
	- 200Gi of capacity for each persistent volume (elasticsearch-data Helm chart).

## Installing

To install the chart with the release name `elasticsearch-umbrella` and default values, run:

```bash
$ helm repo add empathy-public https://empathyco.github.io/helm-charts
$ helm install elasticsearch-umbrella empathy-public/elasticsearch-umbrella
```

## Uninstalling the Chart

To uninstall/delete the `elasticsearch-umbrella` deployment:

```bash
$ helm delete elasticsearch-umbrella
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Usage notes

- The chart just deploys the Empathy's [elasticsearch-master](../elasticsearch-master) and [elastocsearch-data](../elasticsearch-data) as an umbrella Helm chart, to simplify Elasticsearch 6.6.2 deployment. Please refer to the corresponding subcharts for detailed documentation.
- Please make sure to use the same values for `elasticsearch-data.elastic_config."cluster.name"` and `elasticsearch-master.elastic_config."cluster.name"` so that both charts belong to the same Elasticsearch cluster.
- Please also note that `elasticsearch-data.elastic_config."discovery.zen.ping.unicast.hosts"` and `elasticsearch-master.elastic_config."discovery.zen.ping.unicast.hosts"` should have the same value which depends on your release name as `<RELEASE_NAME>-elasticsearch-master-discovery`.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://empathyco.github.io/helm-charts/ | elasticsearch-data | 0.1.0 |
| https://empathyco.github.io/helm-charts/ | elasticsearch-master | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| elasticsearch-data.busybox.image | string | `"busybox:1.31"` | Image for busybox initContainers (sysctlInitContainer in official Elasticsearch Helm chart) |
| elasticsearch-data.elastic_config | object | `{"ES_JAVA_OPTS":"-Xms2048m -Xmx2048m","bootstrap.memory_lock":"true","cluster.name":"test-es","discovery.zen.ping.unicast.hosts":"elasticsearch-umbrella-elasticsearch-master-discovery","logger.org.elasticsearch.discovery.gce":"TRACE","network.bind_host":"0.0.0.0","node.attr.type":"search","node.data":"true","node.ingest":"true","node.master":"false","node.ml":"false","transport.tcp.compress":"true"}` | Elasticsearch configuration added in a configMap and passed to the Elasticsearch pods as Env. Vars. |
| elasticsearch-data.elastic_config."bootstrap.memory_lock" | string | `"true"` | Elasticsearch enable memory lock to avoid swapping |
| elasticsearch-data.elastic_config."cluster.name" | string | `"test-es"` | Elasticsearch cluster.name and should be unique per cluster in the namespace. Note that it should be the same as elasticsearch-master.elastic_config."cluster.name" so both subcharts belong to the same cluster. |
| elasticsearch-data.elastic_config."discovery.zen.ping.unicast.hosts" | string | `"elasticsearch-umbrella-elasticsearch-master-discovery"` | Elasticsearch Zen discovery static unicast hosts. Please note that the "elasticsearch-umbrella" part of the example should be the same as the release name. |
| elasticsearch-data.elastic_config."logger.org.elasticsearch.discovery.gce" | string | `"TRACE"` | Elasticsearch GCE discovery log level |
| elasticsearch-data.elastic_config."network.bind_host" | string | `"0.0.0.0"` | Elasticsearch network.bind_host, network address(es) to which the node should bind in order to listen for incoming connections. |
| elasticsearch-data.elastic_config."node.attr.type" | string | `"search"` | Elasticsearch node attribute type |
| elasticsearch-data.elastic_config."node.data" | string | `"true"` | Elasticsearch data node role |
| elasticsearch-data.elastic_config."node.ingest" | string | `"true"` | Elasticsearch ingest node role |
| elasticsearch-data.elastic_config."node.master" | string | `"false"` | Elasticsearch master node role |
| elasticsearch-data.elastic_config."node.ml" | string | `"false"` | Elasticsearch ml node role |
| elasticsearch-data.elastic_config."transport.tcp.compress" | string | `"true"` | Elasticsearch enable compression between nodes |
| elasticsearch-data.elastic_config.ES_JAVA_OPTS | string | `"-Xms2048m -Xmx2048m"` | Elasticsearch JVM options |
| elasticsearch-data.fullnameOverride | string | `""` | Overrides the clusterName and nodeGroup when used in the naming of resources. This should only be used when using a single nodeGroup, otherwise you will have name conflicts |
| elasticsearch-data.image.pullPolicy | string | `"IfNotPresent"` | The Kubernetes imagePullPolicy value |
| elasticsearch-data.image.repository | string | `"empathyco/elasticsearch"` | Docker repository for Elasticsearch image |
| elasticsearch-data.image.tag | string | `"6.6.2-memlock"` | Overrides the image tag whose default is the chart appVersion. |
| elasticsearch-data.imagePullSecrets | list | `[]` | Configuration for imagePullSecrets so that you can use a private registry for your image |
| elasticsearch-data.ingress.annotations | object | `{}` | Annotations for Kubernetes Ingress |
| elasticsearch-data.ingress.enabled | bool | `false` | Enable Kubernetes Ingress to expose Elasticsearch pods |
| elasticsearch-data.ingress.hosts | list | `[]` | Host and path for Kubernetes Ingress. See values.yaml for an example |
| elasticsearch-data.ingress.tls | list | `[]` | TLS secret for exposing Elasticsearch with https. See values.yaml for an example |
| elasticsearch-data.nameOverride | string | `""` | Overrides the clusterName when used in the naming of resources |
| elasticsearch-data.nodeSelector | object | `{}` | Configurable nodeSelector so that you can target specific nodes for your Elasticsearch cluster |
| elasticsearch-data.podAnnotations | object | `{}` | Configurable annotations applied to all Elasticsearch pods |
| elasticsearch-data.podSecurityContext | object | `{}` | Allows you to set the securityContext for the pod |
| elasticsearch-data.podSecurityPolicy.create | bool | `false` | Create a podSecurityPolicy with minimal permissions to run this Helm chart. Be sure to also set rbac.create to true, otherwise Role and RoleBinding won't be created. |
| elasticsearch-data.podSecurityPolicy.name | string | `""` | The name of the podSecurityPolicy to use. If not set and create is true, a name is generated using the fullname template |
| elasticsearch-data.podSecurityPolicy.spec | object | `{}` | Spec to apply to the podSecurityPolicy. See values.yaml for an example |
| elasticsearch-data.prometheus.annotations | object | `{"app":"prometheus-operator","release":"prometheus"}` | Annotations to include in the ServiceMonitor |
| elasticsearch-data.prometheus.enabled | bool | `false` | Deploy a ServiceMonitor for Prometheus scrapping |
| elasticsearch-data.prometheus.exporter.image | string | `"justwatch/elasticsearch_exporter:1.1.0"` | Exporter image to deploy as a sidecar container |
| elasticsearch-data.rbac.create | bool | `false` | Whether RBAC rules should be created (Role and Rolebinding) |
| elasticsearch-data.replicaCount | int | `3` | Kubernetes replica count for the StatefulSet (i.e. how many pods) |
| elasticsearch-data.resources.limits.cpu | string | `"1000m"` | CPU limits for the StatefulSet |
| elasticsearch-data.resources.limits.memory | string | `"3Gi"` | Memory limits for the StatefulSet |
| elasticsearch-data.resources.requests.cpu | string | `"1000m"` | CPU requests for the StatefulSet |
| elasticsearch-data.resources.requests.memory | string | `"3Gi"` | Memory requests for the StatefulSet |
| elasticsearch-data.securityContext | object | `{"capabilities":{"add":["IPC_LOCK","SYS_RESOURCE"]}}` | Allows you to set the securityContext for the container |
| elasticsearch-data.service.port | int | `9200` | Kubernetes service port, used by Ingress to expose Elasticsearch pods |
| elasticsearch-data.service.type | string | `"ClusterIP"` | Kubernetes service type |
| elasticsearch-data.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| elasticsearch-data.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| elasticsearch-data.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| elasticsearch-data.tolerations | list | `[]` | Configurable tolerations |
| elasticsearch-data.volume.annotations | object | `{}` | Annotations for statefulSet volumes |
| elasticsearch-data.volume.storage | string | `"200Gi"` | Storage resources for statefulSet volumes |
| elasticsearch-data.volume.storage_class | string | `"standard"` | Storage class for statefulSet volumes |
| elasticsearch-master.busybox.image | string | `"busybox:1.31"` | Image for busybox initContainers (sysctlInitContainer in official Elasticsearch Helm chart) |
| elasticsearch-master.elastic_config | object | `{"ES_JAVA_OPTS":"-Xms2048m -Xmx2048m","bootstrap.memory_lock":"true","cluster.name":"test-es","discovery.zen.minimum_master_nodes":"1","discovery.zen.ping.unicast.hosts":"elasticsearch-umbrella-elasticsearch-master-discovery","network.bind_host":"0.0.0.0","node.data":"false","node.ingest":"false","node.master":"true","node.ml":"false","transport.tcp.compress":"true"}` | Elasticsearch configuration added in a configMap and passed to the Elasticsearch pods as Env. Vars. |
| elasticsearch-master.elastic_config."bootstrap.memory_lock" | string | `"true"` | Elasticsearch enable memory lock to avoid swapping |
| elasticsearch-master.elastic_config."cluster.name" | string | `"test-es"` | Elasticsearch cluster.name and should be unique per cluster in the namespace. Note that it should be the same as elasticsearch-data.elastic_config."cluster.name" so both subcharts belong to the same cluster. |
| elasticsearch-master.elastic_config."discovery.zen.minimum_master_nodes" | string | `"1"` | Minimum number of master eligible nodes that need to join a newly elected master in order for an election to complete and for the elected node to accept its mastership. |
| elasticsearch-master.elastic_config."discovery.zen.ping.unicast.hosts" | string | `"elasticsearch-umbrella-elasticsearch-master-discovery"` | Elasticsearch Zen discovery static unicast hosts. Please note that the "elasticsearch-umbrella" part of the example should be the same as the release name. |
| elasticsearch-master.elastic_config."network.bind_host" | string | `"0.0.0.0"` | Elasticsearch network.bind_host, network address(es) to which the node should bind in order to listen for incoming connections. |
| elasticsearch-master.elastic_config."node.data" | string | `"false"` | Elasticsearch data node role |
| elasticsearch-master.elastic_config."node.ingest" | string | `"false"` | Elasticsearch ingest node role |
| elasticsearch-master.elastic_config."node.master" | string | `"true"` | Elasticsearch master node role |
| elasticsearch-master.elastic_config."node.ml" | string | `"false"` | Elasticsearch ml node role |
| elasticsearch-master.elastic_config."transport.tcp.compress" | string | `"true"` | Elasticsearch enable compression between nodes |
| elasticsearch-master.elastic_config.ES_JAVA_OPTS | string | `"-Xms2048m -Xmx2048m"` | Elasticsearch JVM options |
| elasticsearch-master.fullnameOverride | string | `""` | Overrides the clusterName and nodeGroup when used in the naming of resources. This should only be used when using a single nodeGroup, otherwise you will have name conflicts |
| elasticsearch-master.image.pullPolicy | string | `"IfNotPresent"` | The Kubernetes imagePullPolicy value |
| elasticsearch-master.image.repository | string | `"empathyco/elasticsearch"` | Docker repository for Elasticsearch image |
| elasticsearch-master.image.tag | string | `"6.6.2-memlock"` | Overrides the image tag whose default is the chart appVersion. |
| elasticsearch-master.imagePullSecrets | list | `[]` | Configuration for imagePullSecrets so that you can use a private registry for your image |
| elasticsearch-master.ingress.annotations | object | `{}` | Annotations for Kubernetes Ingress |
| elasticsearch-master.ingress.enabled | bool | `false` | Enable Kubernetes Ingress to expose Elasticsearch pods |
| elasticsearch-master.ingress.hosts | list | `[]` | Host and path for Kubernetes Ingress. See values.yaml for an example |
| elasticsearch-master.ingress.tls | list | `[]` | TLS secret for exposing Elasticsearch with https. See values.yaml for an example |
| elasticsearch-master.nameOverride | string | `""` | Overrides the clusterName when used in the naming of resources |
| elasticsearch-master.nodeSelector | object | `{}` | Configurable nodeSelector so that you can target specific nodes for your Elasticsearch cluster |
| elasticsearch-master.podAnnotations | object | `{}` | Configurable annotations applied to all Elasticsearch pods |
| elasticsearch-master.podSecurityContext | object | `{}` | Allows you to set the securityContext for the pod |
| elasticsearch-master.podSecurityPolicy.create | bool | `false` | Create a podSecurityPolicy with minimal permissions to run this Helm chart. Be sure to also set rbac.create to true, otherwise Role and RoleBinding won't be created. |
| elasticsearch-master.podSecurityPolicy.name | string | `""` | The name of the podSecurityPolicy to use. If not set and create is true, a name is generated using the fullname template |
| elasticsearch-master.podSecurityPolicy.spec | object | `{}` | Spec to apply to the podSecurityPolicy. See values.yaml for an example |
| elasticsearch-master.prometheus.annotations | object | `{"app":"prometheus-operator","release":"prometheus"}` | Annotations to include in the ServiceMonitor |
| elasticsearch-master.prometheus.enabled | bool | `false` | Deploy a ServiceMonitor for Prometheus scrapping |
| elasticsearch-master.prometheus.exporter.image | string | `"justwatch/elasticsearch_exporter:1.1.0"` | Exporter image to deploy as a sidecar container |
| elasticsearch-master.rbac.create | bool | `false` | Whether RBAC rules should be created (Role and Rolebinding) |
| elasticsearch-master.replicaCount | int | `3` | Kubernetes replica count for the Deployment (i.e. how many pods) |
| elasticsearch-master.resources.limits.cpu | string | `"1000m"` | CPU limits for the Deployment |
| elasticsearch-master.resources.limits.memory | string | `"3Gi"` | Memory limits for the Deployment |
| elasticsearch-master.resources.requests.cpu | string | `"1000m"` | CPU requests for the Deployment |
| elasticsearch-master.resources.requests.memory | string | `"3Gi"` | Memory requests for the Deployment |
| elasticsearch-master.securityContext | object | `{"capabilities":{"add":["IPC_LOCK","SYS_RESOURCE"]}}` | Allows you to set the securityContext for the container |
| elasticsearch-master.service.port | int | `9200` | Kubernetes service port, used by Ingress to expose Elasticsearch pods |
| elasticsearch-master.service.type | string | `"ClusterIP"` | Kubernetes service type |
| elasticsearch-master.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| elasticsearch-master.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| elasticsearch-master.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| elasticsearch-master.tolerations | list | `[]` | Configurable tolerations |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
