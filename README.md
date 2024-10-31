Homebase
---

Project details here. Just for fun.

Setup
===

* `minikube start`
* `minikube tunnel`
* `minikube mount ....`
* `cp KUBE_CRT ./k8s/client.crt`
* `cp KUBE_KEY ./k8s/client.key`
* `cp KUBE_CA_CRT ./k8s/ca.crt`
* `bin/rails credentials:edit` # should refresh encrypted key values
* `rake deploy`

Service accessible at `http://localhost:8080`