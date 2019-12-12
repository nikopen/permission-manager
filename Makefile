run: 
	go run main.go
dev:
	CLUSTER_NAME=minikube CONTROL_PLANE_ADDRESS=https://192.168.64.32:8443 gomon .

build-ui:
	rm -r statik
	rm -r ./web-client/build

	npm run build --prefix ./web-client 
	statik -src=./web-client/build

delete-users:
	kubectl delete -f ./crd/user-crd-definition.yml && kubectl apply -f ./crd/user-crd-definition.yml

push-image:
	docker build -t git.sighup.io/sighup-products/permission-manager:latest .
	docker push git.sighup.io/sighup-products/permission-manager:latest

