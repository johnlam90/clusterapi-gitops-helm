export GOVC_INSECURE=1 # Don't verify SSL certs on vCenter
export GOVC_URL=10.46.83.23 # vCenter IP/FQDN
export GOVC_USERNAME=administrator@vsphere.local # vCenter username
export GOVC_PASSWORD=DCLab_123!!
export GOVC_DATACENTER=US_DC
export GOVC_DATASTORE=ISCSI-PURE-LUN-4 #Default datastore to deploy to
export GOVC_NETWORK="VLAN-703" # Default network to deploy to
export GOVC_RESOURCE_POOL='k8s' # Default resource pool to deploy to
