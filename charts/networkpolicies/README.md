# networkpolicies

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| aws.dns | bool | `false` |  |
| aws.enabled | bool | `false` |  |
| aws.kinesis | bool | `false` |  |
| aws.redis | bool | `false` |  |
| aws.redisCIDR | string | `"0.0.0.0/0"` |  |
| aws.redisPort | int | `6379` |  |
| aws.s3 | bool | `false` |  |
| aws.sns | bool | `false` |  |
| aws.sqs | bool | `false` |  |
| dns.app | string | `"kube-dns"` |  |
| dns.namespace | string | `"kube-system"` |  |
| egressRules | list | `[]` | [example](#rules) |
| fullnameOverride | string | `""` |  |
| ingressRules | list | `[]` | [example](#rules) |
| mongoAtlas.cidr | string | `"0.0.0.0/0"` |  |
| mongoAtlas.enabled | bool | `false` |  |
| mongoAtlas.port | int | `27017` |  |
| nameOverride | string | `""` |  |

## Rules

```yaml
- selectors:
  - namespaceSelector: {}
    podSelector:
      matchLabels:
        empathy.co/component: test-service
  ports:
    - protocol: TCP
      port: 80
```