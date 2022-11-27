# Quick start (Ambiente Linux)

## Ambiente de Desenvolvimento

URL padrão depois de subir a aplicação: http://localhost:8081 \
Ferramentas necessárias para subir no ambiente de Desenvolvimento
- git,terminal,docker,docker-compose,vscode

```
git clone https://github.com/jniltinho/desafio-devops.git
cd desafio-devops
docker-compose build
docker-compose up
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

curl -L -o kind https://github.com/kubernetes-sigs/kind/releases/download/v0.17.0/kind-linux-amd64
chmod +x kind
sudo mv kind /usr/local/bin/
```

### Subindo o cluster local usando o kind
```
git clone https://github.com/jniltinho/desafio-devops.git
kind create cluster --config=desafio-devops/k8s/kind-config.yaml
kubectl cluster-info --context kind-desafio-devops-cluster
```
