
# Prerequisites

## Packages

### Install Gocv

```bash
# MacOS
govc – brew tap govmomi/tap/govc && brew install govmomi/tap/govc

# Linux
wget https://github.com/vmware/govmomi/releases/download/v0.20.0/govc_linux_amd64.gz
gunzip govc_linux_amd64.gz
mv govc_linux_amd64 govc
chown root govc
chmod ug+r+x govc
mv govc /usr/local/bin/

# Verify
source govcvars.sh
govc about
```

### Install kind

```bash
# MacOS
brew install kind

# Linux
curl -Lo ./kind "https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-$(uname)-amd64"\nchmod +x ./kind
chmod +x ./kind
mv ./kind /usr/local/bin/kind

# Lauch kind cluster
kind create cluster
kubectl cluster-info
```

### Install clusterctl

```bash
# MacOS
curl -L https://github.com/kubernetes-sigs/cluster-api/releases/download/v0.3.6/clusterctl-darwin-amd64 -o clusterctl
chmod +x ./clusterctl
sudo mv ./clusterctl /usr/local/bin/clusterctl
clusterctl version

# Linux
curl -L https://github.com/kubernetes-sigs/cluster-api/releases/download/v0.3.6/clusterctl-linux-amd64 -o clusterctl
chmod +x ./clusterctl
sudo mv ./clusterctl /usr/local/bin/clusterctl
clusterctl version
```
