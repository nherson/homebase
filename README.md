Homebase
---

A fun little hobby project. Uses kubernetes to easily launch and tear down Terraria worlds, running locally. Worlds managed with a simple Rails app. Currently runs with `minikube` and spins up Terraria servers using `TShock`.

Setup
===

To get started running locally:

* `minikube start`
* `minikube tunnel`
* `minikube mount storage/worlds:/worlds`
* `cp KUBE_CRT ./k8s/client.crt`
* `cp KUBE_KEY ./k8s/client.key`
* `cp KUBE_CA_CRT ./k8s/ca.crt`
* `rake secrets:init`
* `rake deploy`

Service accessible at `http://localhost:8080`