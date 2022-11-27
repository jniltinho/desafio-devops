DB_NAME := backenddb
DB_USER := sa
DB_PASS := 123456


.PHONY: all

all: build-frontend build-backend


build-frontend:
	cd frontend/app; docker build --no-cache -t frontend .
	docker images

build-backend:
	cd backend/app; docker build --no-cache -t backend .
	docker images

deploy-compose:
	docker-compose build
	docker-compose up -d

add-user-mysql-compose:
	docker-compose exec mysqldb mysql -u $(DB_USER) -p$(DB_PASS) $(DB_NAME) -e "INSERT INTO usuario (username, password) VALUES('admin', 'admin');"
	docker-compose exec mysqldb mysql -u $(DB_USER) -p$(DB_PASS) $(DB_NAME) -e "SELECT * FROM usuario;"

create-cluster-kind:
	kind create cluster --config=k8s/kind-config.yaml
	kubectl cluster-info --context kind-desafio-devops-cluster

deploy-kubernetes-local:
	kubectl apply -f k8s/deployment-mysql.yaml
	kubectl apply -f k8s/deployment-frontend.yaml
	kubectl apply -f k8s/deployment-backend.yaml
	
add-user-mysql-k8s:
	$(eval POD := $(shell kubectl get pod -l app=mysqldb -o jsonpath="{.items[0].metadata.name}"))
	kubectl exec $(POD) -- mysql -u $(DB_USER) -p$(DB_PASS) $(DB_NAME) -e "INSERT INTO usuario (username, password) VALUES('admin', 'admin');"
	kubectl exec $(POD) -- mysql -u $(DB_USER) -p$(DB_PASS) $(DB_NAME) -e "SELECT * FROM usuario;"
