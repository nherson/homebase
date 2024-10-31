# typed: strict

require "sorbet-runtime"

# TerrariaResources provides functions for generating
# All required kubernetes resources for hosting Terraria
# servers.
module Terraria
  module Resources
    extend T::Sig

    # Returns the prefix (without the trailing `-`) of resources created
    # in kubernetes using this module
    sig { returns(String) }
    def self.resource_prefix
      "terraria-tshock-server"
    end

    # TShockDeployment contains kubernetes resource information for a TShock server deployment
    class TShockServer
      extend T::Sig
      sig { params(name: String, port: Integer).void }
      def initialize(name, port)
        # TODO: validation (string is kebab case, port is in a valid range)
        @name = name
        @port = port
      end

      sig { returns(TShockDeployment) }
      def deployment
        TShockDeployment.new(@name)
      end

      sig { returns(TShockService) }
      def service
        TShockService.new(@name, @port)
      end

      # Standard parameterized Deployment resource for a Terraria server
      class TShockDeployment < Kubeclient::Resource
        extend T::Sig
        sig { params(name: String).void }
        def initialize(name)
          super(
            metadata: {
              namespace: "default",
              creationTimestamp: nil,
              name: "terraria-tshock-server-#{name}",
              labels: {
                app: "terraria-tshock-server-#{name}"
              }
            },
            spec: {
              replicas: 1,
              selector: {
                matchLabels: {
                  app: "terraria-tshock-server-#{name}"
                }
              },
              strategy: {},
              template: {
                metadata: {
                  namespace: "default",
                  creationTimestamp: nil,
                  labels: {
                    app: "terraria-tshock-server-#{name}"
                  }
                },
                spec: {
                  containers: [
                    {
                      image: "terraria-tshock-server:latest",
                      name: "terraria-tshock-server",
                      resources: {},
                      imagePullPolicy: "Never",
                      env: [
                        {
                          name: "TSHOCK_WORLD_NAME",
                          value: name
                        }
                      ],
                      volumeMounts: [
                        {
                          mountPath: "/worlds",
                          name: "worlds-directory-volume"
                        }
                      ]
                    }
                  ],
                  volumes: [
                    {
                      name: "worlds-directory-volume",
                      hostPath: {
                        path: "/worlds",
                        type: "Directory"
                      }
                    }
                  ]
                }
              }
            },
          )
        end
      end

      # Standard parameterized Service resource for a Terraria server
      class TShockService < Kubeclient::Resource
        extend T::Sig
        sig { params(name: String, port: Integer).void }
        def initialize(name, port)
          super(
            metadata: {
              namespace: "default",
              labels: {
                app: "terraria-tshock-server-#{name}"

              },
              name: "terraria-tshock-server-#{name}"
            },
            spec: {
              allocateLoadBalancerNodePorts: true,
              externalTrafficPolicy: "Cluster",
              internalTrafficPolicy: "Cluster",
              ipFamilies: [ "IPv4" ],
              ipFamilyPolicy: "SingleStack",
              ports: [ {
                port: port,
                protocol: "TCP",
                targetPort: 7777
              } ],
              selector: {
                app: "terraria-tshock-server-#{name}"
              },
              sessionAffinity: "None",
              type: "LoadBalancer"
            }
          )
        end
      end
    end
  end
end
