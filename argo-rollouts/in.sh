kubectl create ns argo-rollouts 2>/dev/null || true
# htpasswd 없으면: apt-get install -y apache2-utils
USER=admin
PASS='admin'
kubectl -n argo-rollouts create secret generic rollouts-basic-auth \
  --from-literal=users="$(htpasswd -nbB "$USER" "$PASS")" \
  --dry-run=client -o yaml | kubectl apply -f -

#heml
helm upgrade --install argo-rollouts argo/argo-rollouts \
  -n argo-rollouts --create-namespace \
  -f values-argorollouts.yaml

#remote edit 3
