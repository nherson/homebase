require_relative 'homebase'

task default: %w[list]

task :launch, [:name, :port] do |_t, args|
  puts "Launching server with world name #{args[:name]} and port #{args[:port]}"
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
