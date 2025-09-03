echo "=== Gateway ==="
kubectl get gateway -n istio-system

echo "=== VirtualService ==="
kubectl get virtualservice -n istio-system -o custom-columns=NAME:.metadata.name,GATEWAYS:.spec.gateways,HOSTS:.spec.hosts

echo "=== Ingress Gateway Pods ==="
kubectl get pods -n istio-system -l app=istio-ingressgateway

echo "=== Ingress Gateway Service ==="
kubectl get svc -n istio-system
