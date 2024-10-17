# typed: strict

require 'k8s-ruby'
require 'kubeclient'
require 'sorbet-runtime'
require 'pry'

# TerrariaServerManager is the main entrypoint for managing
# running Terraria servers on kubernetes
class TerrariaServerManager
  extend T::Sig

  sig { void }
  def initialize
    config = Kubeclient::Config.read(ENV['KUBECONFIG'] || "#{ENV['HOME']}/.kube/config")
    @core_client = T.let(kubeclient(config), T.untyped)
    @app_client = T.let(kubeclient(config, 'apis/apps'), T.untyped)
  end

  sig { void }
  def deployments
    @app_client.get_deployments(namespace: 'default').each do |d|
      puts d.metadata.name
    end
  end

  private

  sig { params(config: T.untyped, endpoint_suffix: T.nilable(String)).returns(T.untyped) }
  def kubeclient(config, endpoint_suffix = nil)
    endpoint = endpoint_suffix.nil? ? config.context.api_endpoint : "#{config.context.api_endpoint}/#{endpoint_suffix}"
    T.let(
      Kubeclient::Client.new(
        endpoint,
        'v1',
        ssl_options: config.context.ssl_options,
        auth_options: config.context.auth_options
      ), T.untyped
    )
  end
end
