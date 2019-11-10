# find-veth
Identify which veth interface a given pod is using

## Usage
`./find_veth.sh <pod_name>`

OBS.: The pod should be running in the same node that you are running this script. To check on which node the pod is allocated use the command `kubectl get pod -o wide`
