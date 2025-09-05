# 1. --------------------------------------------
# k8s.cnf
[req]
default_bits       = 2048
distinguished_name = req_distinguished_name
req_extensions     = req_ext
prompt             = no

[req_distinguished_name]
C  = KR
ST = Seoul
L  = Seoul
O  = k8sOrg
CN = k8s.com   # Common Name

[req_ext]
subjectAltName = @alt_names

[alt_names]
DNS.1 = gitea.k8s.com   # SAN
DNS.2 = jenkins.k8s.com   # SAN
DNS.3 = argocd.k8s.com   # SAN

# 2. --------------------------------------------
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout k8s.key \
  -out k8s.crt \
  -config k8s.cnf \
  -extensions req_ext

# 3. --------------------------------------------
# 신뢰할 수 없는 기관으로 인한 TLS 오류를 보지 않고자 할 경우 윈도우에 신뢰할 수 있는 루트 인증 기관으로 k8s.crt를 추가
# k8s.crt를 더블클릭해서 '인증서 설치...' 클릭, '모든 인증서를 다음 저장소에 저장'을 선택하고 찾아보기에서 '신뢰할 수 있는 루트 인증 기관' 선택 후 설치
# 바로 반영이 안될경우 재부팅