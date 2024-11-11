# typed: strict

module Api
  module V1
    class WorldsController < ActionController::API
      extend T::Sig

      sig { void }
      def initialize
        super
        @world = T.let(nil, T.nilable(World))
      end

      sig { returns(T.untyped) }
      def index
        render json: World.all
      end

      sig { returns(T.untyped) }
      def create
        params.require(:world).permit(:name, :port)
        unless params[:world][:port].is_a? Integer
          return render json: { error: "port must be an integer" }, status: :bad_request
        end
        @world = World.new(name: params[:world][:name], port: params[:world][:port])
        if @world.save
          render json: @world
        else
          render json: @world.errors, status: 500
        end
      end
    end
  end
end
