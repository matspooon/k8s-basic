# local에서 최소 pod으로 개발목적으로 설치하려면 품이 많이 들어감

# gitea custom lite 설치(postgresql pod X, sqlite3 사용, persistence X)
helm repo add gitea-charts https://dl.gitea.io/charts/
helm repo update

helm install gitea gitea-charts/gitea \
  --namespace dev-tools \
  --create-namespace \
  -f gitea-dev-local.yaml

# jenkins 설치
helm repo add jenkins https://charts.jenkins.io
helm repo update
helm upgrade --install jenkins jenkins/jenkins \
--namespace ${JENKINS_NS} \
--set controller.admin.username=${JENKINS_ADMIN_USER} \
--set controller.admin.password=${JENKINS_ADMIN_PASS} \
--set controller.serviceType=ClusterIP \