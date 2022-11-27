# Quick start (Ambiente Linux)

## Ambiente de Desenvolvimento

URL padrão depois de subir a aplicação: http://localhost:8081 \
Ferramentas necessárias para subir no ambiente de Desenvolvimento
- git,terminal,docker,docker-compose,make

```
git clone https://github.com/jniltinho/desafio-devops.git
cd desafio-devops
make deploy-compose
make add-user-mysql-compose
## User: admin Pass: admin
## http://localhost:8081
```

## Ambiente com Kind (Kubernetes) Local

Ferramentas necessárias para subir um cluster kubernetes local com kind
- git,terminal,docker

### Instale o kubectl e kind
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

curl -Lo kind https://github.com/kubernetes-sigs/kind/releases/download/v0.17.0/kind-linux-amd64
chmod +x kind
sudo mv kind /usr/local/bin/
```

### Subindo o cluster local usando o kind
```
git clone https://github.com/jniltinho/desafio-devops.git
kind create cluster --config=desafio-devops/k8s/kind-config.yaml
kubectl cluster-info --context kind-desafio-devops-cluster
kubectl apply -f desafio-devops/k8s/deployment-mysql.yaml
kubectl apply -f desafio-devops/k8s/deployment-frontend.yaml
kubectl apply -f desafio-devops/k8s/deployment-backend.yaml
```

## Links
- https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
- https://kind.sigs.k8s.io/docs/user/quick-start/
- https://www.youtube.com/watch?v=dL19dSGKZoc
