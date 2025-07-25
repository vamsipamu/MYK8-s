k8's architecture:

A Kubernetes cluster consists of a Control Plane (API Server, Scheduler, Controller Manager, etcd) and multiple Worker Nodes (Kubelet, Kube Proxy, Container Runtime). The control plane manages the cluster state, while the worker nodes run the actual workloads (pods).

Scheduler:
It is used to search pending tasks which are present in ETCD.
If any pending task found in ETCD, it will schedule in worker node.
It will decide in which worker node our task should gets executed.
It will decide by communication with the kubelet in worker node
Scheduler always monitor API-Server
The scheduler is a crucial component responsible for assigning pods to nodes
This will ensure that pods are scheduled on suitable nodes that meet their resource requirements
and constraints
ETCD:
It is like a database to our k8's
it is used to store the requests of our cluster like pods, nodes, configs, secrets, roles etc..
APISERVER:
It is used to validate and accept the request from the user and store the request in ETCD.
It is the only component that interacts with the ETCD directly
controller-manager:
Runs various controllers (e.g., Node, ReplicaSet, Job) to monitor and maintain the desired state.

WORKER NODE COMPONENTS:

kubelet:
Agent that runs on each node, communicates with the API server, ensures containers are running.
kube-proxy:
Manages networking rules to route traffic to the correct pod using Services.
Container Runtime:
Responsible for running the containers (e.g., containerd, Docker, CRI-O).


CoreDNS	Resolves service and pod names to IPs within the cluster.
Ingress Controller	Manages HTTP and HTTPS access from outside the cluster.
Metrics Server	Collects metrics for autoscalin

communication flow:
You run kubectl apply -f deployment.yaml
kubectl talks to the kube-apiserver
The API server stores config/state in etcd
The scheduler finds the best node to place the pod
The kubelet on that node pulls the image and starts the container
kube-proxy and service route traffic to the pod

Summary of Interactions
Component	   Role in the Flow
kubectl	          Sends request to API
kube-apiserver	  Validates & stores the object
etcd	          Stores desired state
kube-scheduler	  Chooses node for pod
kubelet	          Pulls image and starts container
containerd	  Runs the actual container
kube-proxy	  Sets up network rules
CoreDNS	          Resolves internal DNS


SERVICES:

A Kubernetes Service provides a stable network identity (IP and DNS) to access a set of dynamic, ephemeral pods. It enables internal and external communication with pods regardless of their individual IPs, and supports load balancing across multiple pod replicas.

Key Features of Kubernetes Services:

Feature                 Explanation
        
Stable IP/DNS	        Unlike pods, the service has a fixed ClusterIP and DNS name (myapp.default.svc.cluster.local).
Load Balancing	        Routes requests to all healthy pods behind the service.
Pod Discovery	        Enables other services/pods to locate and talk to a set of backend pods.
Supports Selectors	Uses labels to find and group pods automatically.

Types of Services:

Type	                    Use Case

ClusterIP (default)	Internal-only communication (within the cluster).
NodePort	        Exposes service on a port of each node.
LoadBalancer	        Integrates with cloud provider to expose via external LB.
ExternalName	        Maps service to an external DNS (useful for databases, APIs).
Headless Service	No load balancing — exposes individual pod DNS (used with StatefulSets)


relation btw kube-proxy and services:

DNS resolves to ClusterIP (e.g., 10.96.0.15)
Traffic hits this virtual IP
kube-proxy intercepts the request
It forwards to one of the pods selected by the service


pv & pvc:
pv: A Persistent Volume is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using StorageClasses
pvc :A Persistent Volume Claim is a request for storage by a user. It specifies size, access modes, and optionally a storageClassName.

User creates a PVC.
Kubernetes searches for a matching PV.
If found, it binds the PVC to the PV.
If not found and dynamic provisioning is enabled, it creates a new PV.
The pod uses the PVC to mount the volume.

 Access Modes
ReadWriteOnce (RWO): Mounted as read-write by a single node.
ReadOnlyMany (ROX): Mounted as read-only by many nodes.
ReadWriteMany (RWX): Mounted as read-write by many nodes.


