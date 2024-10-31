# typed: true

# In order to use kubeclient in a type-safe way, because it uses dynamically
# defined methods, add signatures here for any methods and types that need
# to be used in the application. Build this out as needed.

module Kubeclient
  class Client
    extend T::Sig

    sig { params(resource: Terraria::Resources::TShockServer::TShockDeployment).void }
    def create_deployment(resource); end

    # Override the existing method signature
    sig { params(resource: Terraria::Resources::TShockServer::TShockService).void }
    def create_service(resource); end

    sig { params(namespace: String).returns(Kubeclient::Common::EntityList) }
    def get_deployments(namespace:); end

    sig { params(name: String, namespace: String).void }
    def delete_deployment(name, namespace); end

    sig { params(name: String, namespace: String).void }
    def delete_service(name, namespace); end
  end
end
