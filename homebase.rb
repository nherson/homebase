# typed: strict

require 'kubeclient'
require 'sorbet-runtime'

require_relative 'resources'

# TerrariaServerManager is the main entrypoint for managing
# running Terraria servers on kubernetes
class TerrariaServerManager
  extend T::Sig

  sig { void }
  def initialize
    config = Kubeclient::Config.read(ENV['KUBECONFIG'] || "#{ENV['HOME']}/.kube/config")
    @core_client = T.let(kubeclient(config), Kubeclient::Client)
    @app_client = T.let(kubeclient(config, 'apis/apps'), Kubeclient::Client)
  end

  sig { void }
  def deployments
    @app_client.get_deployments(namespace: 'default').each do |d|
      puts d.metadata.name
    end
  end

  sig { params(name: String, port: Integer).void }
  def launch(name, port)
    server = TerrariaResources::TShockServer.new(name, port)
    @app_client.create_deployment(server.deployment)
    @core_client.create_service(server.service)
  end

  sig { params(name: String, purge: T::Boolean).void }
  def destroy(name, purge: false)
    resource_name = "#{TerrariaResources.resource_prefix}-#{name}"
    # binding.pry
    @core_client.delete_service(resource_name, 'default')
    @app_client.delete_deployment(resource_name, 'default')
    delete_world_files(name) if purge
  end

  private

  sig { params(name: String).void }
  def delete_world_files(name)
    directory = 'worlds'
    pattern = /#{name}\.wld(\.bak)?/

    matching_files = Dir.glob(File.join(directory, '*')).select { |file| file =~ pattern }
    matching_files.each { |file| File.delete(file) }
  end

  sig { params(config: Kubeclient::Config, endpoint_suffix: T.nilable(String)).returns(Kubeclient::Client) }
  def kubeclient(config, endpoint_suffix = nil)
    endpoint = endpoint_suffix.nil? ? config.context.api_endpoint : "#{config.context.api_endpoint}/#{endpoint_suffix}"
      Kubeclient::Client.new(
        endpoint,
        'v1',
        ssl_options: config.context.ssl_options,
        auth_options: config.context.auth_options
      )
  end
end
