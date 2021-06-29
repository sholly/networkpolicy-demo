## Network Policy demo

Create projects: 
oc apply -f leaf1/projectrequest.yaml
oc apply -f leaf2/projectrequest.yaml

Label both namespaces, this will be needed to apply network policies across projects. 
oc label ns networkpolicy-leaf1 name=networkpolicy-leaf1
oc label ns networkpolicy-leaf2 name=networkpolicy-leaf2

Deploy applications: 
oc apply -f leaf1/application-leaf1.yaml
oc apply -f foo/application-foo.yaml
oc apply -f leaf2/application-leaf2.yaml

Traffic flow: 

networkpolicy-leaf1: 

Call leaf1 directly. 

Leaf1 calls the foo services in the same namespace. 

Leaf1 calls leaf2 in the networkpolicy-leaf2 namespace. 

networkpolicy-leaf2: 

Call leaf2 directly. 

Leaf2 calls leaf2 in the networkpolicy-leaf1 namespace. 

To observe traffic when applying various networkpolicies; 

Run leaf1.sh and leaf2.sh in separate terminal windows. 


Openshift default is to allow everything, so every call works. 

Apply default-deny to both namespaces. 

oc apply -f leaf1/networkpolicy-default-deny.yaml 

oc apply -f leaf2/networkpolicy-default-deny.yaml 

Observe that every call fails now. 


Allow ingress traffic to both namespaces: 

 oc apply -f leaf1/networkpolicy-allow-ingress.yaml 
 oc apply -f leaf2/networkpolicy-allow-ingress.yaml

 Now the direct calls to leaf1 and leaf2 should work.  

Allow all inter-pod traffic in networkpolicy-leaf1: 

oc apply -f leaf1/networkpolicy-allow-same-namespace.yaml 

Note the calls from leaf1 -> foo in networkpolicy-leaf1 are now working. 

Finally allow traffic from leaf1 to leaf2, and leaf2 to leaf1. 

oc apply -f leaf1/networkpolicy-allow-leaf2.yaml 
oc apply -f leaf2/networkpolicy-allow-leaf1.yaml 

