# typed: true

class WorldsController < ApplicationController
  extend T::Sig

  sig { void }
  def initialize
    super
    @world = T.let(nil, T.nilable(World))
    @worlds = T.let(nil, T.nilable(T::Array[World]))
  end

  sig { returns(T.untyped) }
  def index
    @worlds = World.all
  end

  sig { returns(T.untyped) }
  def create
    # TODO
  end

  sig { returns(T.untyped) }
  def show
    @world = World.find(params[:id])
  end

  sig { returns(T.untyped) }
  def new
  end

  sig { returns(T.untyped) }
  def destroy
    # TODO
  end
end
