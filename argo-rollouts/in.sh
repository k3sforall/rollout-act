helm upgrade --install argo-rollouts argo/argo-rollouts \
  -n argo-rollouts --create-namespace \
  -f values-argorollouts.yaml
