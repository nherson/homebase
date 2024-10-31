# typed: strict

class ApplicationController < ActionController::Base
  extend T::Sig
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Create a central kubernetes API client to reuse in requests
  sig { returns(Terraria::ServerManager) }
  def terraria_server_manager
    @terraria_server_manager ||= T.let(Terraria::ServerManager.new, T.nilable(Terraria::ServerManager))
  end
end
