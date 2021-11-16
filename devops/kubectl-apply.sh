#! /bin/bash


# configure the server and deploy the hello-world app
microk8s kubectl apply -f ./devops/kubernetes/homolog-namespace.yml
microk8s kubectl config set-context --current --namespace=homolog
microk8s kubectl apply -f ./devops/kubernetes/hello-world-deployment.yml
microk8s kubectl apply -f ./devops/kubernetes/hello-world-service.yml

# start the kubernetes admin dashboard
nohup microk8s dashboard-proxy &

# expose the ArgoCD UI and the app for the host network
nohup microk8s kubectl port-forward svc/argocd-server 8081:443 --namespace=argocd &
nohup microk8s kubectl port-forward svc/hello-world-homolog-svc 8080:8080 --namespace=homolog &
# microk8s kubectl expose svc argocd-server \
#     --port=8081 \
#     --target-port=443 \
#     --name=argocd \
#     --namespace=argocd
# microk8s kubectl expose svc hello-world-homolog-svc \
#     --port=8080 \
#     --target-port=8080 \
#     --name=hello-world \
#     --namespace=homolog
