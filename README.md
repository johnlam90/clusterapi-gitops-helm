# Cluster API GitOps using helm and ArgoCD

<p float="center">
  <img src="./docs/images/git-icon.png" width="160" /> 
  <img src="./docs/images/plus2.png" width="50" /> 
  <img src="./docs/images/helm.svg" width="160" /> 
  <img src="./docs/images/plus2.png" width="50" /> 
  <img src="./docs/images/capi.png" width="160" />
  <img src="./docs/images/plus2.png" width="50" /> 
  <img src="./docs/images/argocd.png" width="160" /> 

</p>

## Goals

- To bring [declarative style](https://cluster-api.sigs.k8s.io/introduction.html), Kubernetes style APIs to cluster creation
- Use helm to modify k8 cluster values based on requirement. This helps in code reusability
- Version control
- Using GitOps([ArgoCD](https://github.com/argoproj/argo-cd)) to deploy, scale-in/scale-out and rollback your Kubernetes clusters.

<img width="1618" alt="argo" src="https://user-images.githubusercontent.com/8691485/86292370-3ec8a400-bbb6-11ea-8a61-4ab034c6decc.png">


## Prerequisites

- [kind](https://kind.sigs.k8s.io/) - This will act as your management cluster for bootstrapping cluster-api components.
- [clusterctl](https://cluster-api.sigs.k8s.io/user/quick-start.html) - The clusterctl CLI tool handles the lifecycle of a Cluster API management cluster.
- [Govc](https://github.com/vmware/govmomi/tree/master/govc) - Govc will be used to interact with your vSphere environment.
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [helm](https://github.com/helm/helm)
- vSphere 6.7U3 or above

For more information refer to the cluster-api [quickstart](https://cluster-api.sigs.k8s.io/user/quick-start.html)

## Installation 

### Clone repository 
```
git clone https://github.com/johnlam90/capv-helm.git
cd capv-helm 
```
### Install argocd on you kind cluster
 
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
### Access the GUI using port forwarding 
**Note:** Ideally you will use LoadBalancer or Ingress in production deployments, but port forwarding will do for our kind cluster. Refer to the argo [doc](https://argoproj.github.io/argo-cd/getting_started/)

```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

### Deploy the Application 

```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: capv
  namespace: argocd
spec:
  destination:
    namespace: 'default'
    server: https://kubernetes.default.svc
  project: default
  source:
    helm:
      valueFiles:
      - values.yaml
    path: capv
    repoURL: https://github.com/johnlam90/capv-helm.git
    targetRevision: HEAD
  syncPolicy:
    automated: {}
```

**Note:** Change the ``repoURL`` to your git repository 
