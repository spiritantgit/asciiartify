## Getting Started

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

## Run ArgoCd in background
sudo kubectl port-forward svc/argocd-server -n argocd 8080:443&

## Get Password
sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath={.data.password} | base64 -d; echo

Use admin login and password from command above to log-in.

## Check configuration

sudo kubectl get cm argocd-cm -n argocd -oyaml

## Add Auto Sync

sudo kubectl patch cm argocd-cm -n argocd -p '{"data":{"timeout.reconciliation":"30s"}}'

![Alt Text](https://github.com/spiritantgit/asciiartify/blob/main/demosync.gif)