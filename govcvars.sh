
# Change the below variables 

## Sample 
#export GOVC_INSECURE=1 
#export GOVC_URL=10.10.10.10 
#export GOVC_USERNAME=administrator@vsphere.local 
#export GOVC_PASSWORD=admin123
#export GOVC_DATACENTER=US_DC
#export GOVC_DATASTORE=ISCSI-PURE-LUN-4 
#export GOVC_NETWORK="VLAN-100" 
#export GOVC_RESOURCE_POOL='k8s' 

export GOVC_INSECURE=1                             # Don't verify SSL certs on vCenter
export GOVC_URL=                                   # vCenter IP/FQDN
export GOVC_USERNAME=                              # vCenter username
export GOVC_PASSWORD=                              # vCenter password 
export GOVC_DATACENTER=                            # Default datacenter
export GOVC_DATASTORE=                             # Default datastore to deploy to
export GOVC_NETWORK=" "                            # Default network to deploy to
export GOVC_RESOURCE_POOL=' '                      # Default resource pool to deploy to
