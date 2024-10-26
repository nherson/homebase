# typed: true

# In order to use kubeclient in a type-safe way, because it uses dynamically
# defined methods, add signatures here for any methods and types that need
# to be used in the application. Build this out as needed.

class Kubeclient::Client
  extend T::Sig

  sig { params(resource: TerrariaResources::TShockServer::TShockDeploymentResource).void }
  def create_deployment(resource); end

  # Override the existing method signature
  sig { params(resource: TerrariaResources::TShockServer::TShockServiceResource).void }
  def create_service(resource); end

  sig { params(namespace: String).returns(T::Array[Kubeclient::Resource::Deployment]) }
  def get_deployments(namespace:); end

  sig { params(name: String, namespace: String).void }
  def delete_deployment(name, namespace); end

  sig { params(name: String, namespace: String).void }
  def delete_service(name, namespace); end
end


# Some custom types to define the shape of ambiguous data returned by kubeclient
class Kubeclient::Resource::Deployment < Kubeclient::Resource
  extend T::Sig

  sig { returns(Metadata) }
  attr_reader :metadata

  class Metadata
    extend T::Sig

    sig { returns(String) }
    attr_reader :name
  end
end
