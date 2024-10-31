# typed: strict

module Api
  module V1
    class WorldsController < ApplicationController
      extend T::Sig

      sig { returns(T.untyped) }
      def index
        render json: terraria_server_manager.deployments
      end
    end
  end
end
