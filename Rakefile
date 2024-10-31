require_relative 'lib/terraria/server_manager'
require_relative 'config/application'

Rails.application.load_tasks

task default: %w[list]

task :launch, [ :name, :port ] do |_t, args|
  puts "Launching server with world name #{args[:name]} and port #{args[:port]}"
  c = Terraria::ServerManager.new
  c.launch(args[:name], args[:port].to_i)
end

task :destroy, [ :name ] do |_t, args|
  puts "Destroying server with world name #{args[:name]}"
  c = Terraria::ServerManager.new
  c.destroy(args[:name], purge: true)
end

task :list do
  c = Terraria::ServerManager.new
  c.deployments.each do |d|
    puts d.metadata.name
  end
end

task :deploy do
  sh './scripts/deploy.sh'
end

namespace :sorbet do
  desc 'Generate types for installed gems'
  task :generate do
    sh 'bin/tapioca gems'
  end
end

namespace :secrets do
  task :_wipe do
    sh 'rm config'
  end

  desc 'Registers required secrets into the minikube cluster'
  task :init do
    # Create the initial keys (local and production)
    sh 'bin/rails credentials:edit --environment production'
    sh 'bin/rails credentials:edit'
    # Wire the production key into kubernetes
    key = File.read("config/credentials/production.key")
    puts "THING: #{key}"
    sh "kubectl create secret generic rails-master-key --from-literal=key=#{key}"
  end

  desc 'Update config/credentials/production.key in the kubernetes cluster'
  task :update do
    key = File.read("config/credentials/production.key")
    sh "kubectl patch secret rails-master-key -p '{\"data\":{\"key\": \"#{Base64.encode64(key).chomp}\"}}'"
  end
end
