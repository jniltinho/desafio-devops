# Quick start (Ambiente Linux)

## Ambiente de Desenvolvimento

Ferramentas necessárias para subir no ambiente de Desenvolvimento \
**git,terminal,docker,docker-compose,make**

### Escolha entre Docker-Compose ou Kubernetes

URL: http://localhost:8081 | User: admin Pass: admin

## Usando Docker-Compose

```
git clone https://github.com/jniltinho/desafio-devops.git
cd desafio-devops
make deploy-compose
make add-user-mysql-compose
```

## Usando Kubernetes Local

### Instale o kubectl + kind
```
git clone https://github.com/jniltinho/desafio-devops.git
cd desafio-devops
make install-kubectl
make install-kind
```

### Subindo um cluster kubernetes local usando o kind
```
git clone https://github.com/jniltinho/desafio-devops.git
cd desafio-devops
make create-cluster-kind
```

### Deploy no cluster de kubernetes local
```
git clone https://github.com/jniltinho/desafio-devops.git
cd desafio-devops
make deploy-kubernetes
## Espere até os pods estejam READY (kubectl get pods)
make add-user-mysql-k8s
## Acesso ao service sem ingress
## kubectl port-forward service/frontend 8081:80 & kubectl port-forward service/backend 8080:80
```

## Links
- https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
- https://kind.sigs.k8s.io/docs/user/quick-start/
- https://www.youtube.com/watch?v=dL19dSGKZoc
