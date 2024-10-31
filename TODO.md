* ~~Rails service running on k8s~~
* ~~Parameterize container to use specified port and world name~~
* ~~Ruby script to start a named world~~
* ~~World file persistence~~ (works with minikube mounting, kinda hacky and not flexible)
* Some sort of "ready" update from the container
* Support more options for launching new worlds
  * Prob best to do after Rails integration
* ~~Destroy world support~~
* Persistence for DB running in minikube
  * First: sqlite file
  * Later: MySQL
* Proper secret storage
  * k8s secrets?
* Wire up TShock status API