![Image](/argocd2.png)
![Image](/argocd1.png)


| Getting Started with ArgoCD 	| 
Create a new Namespace  
kubectl create namespace argocd kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml  

Run ArgoCd in background 

sudo kubectl port-forward svc/argocd-server -n argocd 8080:443&  


Get Password sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath={.data.password} \| base64 -d; echo  

Use admin login and password from command above to log-in. 	|
|-----------------------------	|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|
