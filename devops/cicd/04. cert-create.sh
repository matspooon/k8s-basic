# 1. 개인키 생성 (2048비트 RSA)
openssl genrsa -out k8s.key 2048

# 2. 인증서 서명 요청(CSR) 생성
openssl req -new -key k8s.key -out k8s.csr -subj "/CN=k8s.com/O=K8sOrg"

# 3. 자체 서명 인증서 발급 (유효기간 365일)
openssl x509 -req -days 365 -in k8s.csr -signkey k8s.key -out k8s.crt

# 4. 쿠버네티스 시크릿 생성 (istio-system 네임스페이스에 TLS 시크릿 생성)
kubectl create -n istio-system secret tls selfsigned-gateway-cert \
  --key k8s.key \
  --cert k8s.crt