require_relative 'homebase'
require_relative 'config/application'

Rails.application.load_tasks

task default: %w[list]

task :launch, [ :name, :port ] do |_t, args|
  puts "Launching server with world name #{args[:name]} and port #{args[:port]}"
  c = TerrariaServerManager.new
  c.launch(args[:name], args[:port].to_i)
end

task :destroy, [ :name ] do |_t, args|
  puts "Destroying server with world name #{args[:name]}"
  c = TerrariaServerManager.new
  c.destroy(args[:name], purge: true)
end

task :list do
  c = TerrariaServerManager.new
  c.deployments
end

namespace :sorbet do
  desc 'Generate types for installed gems'
  task :generate do
    sh 'bin/tapioca gems'
  end
end
