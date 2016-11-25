class Admin::ApplicationController < ApplicationController

  before_action :authenticate!

  layout "admin/application"

private

  def authenticate!
    authenticate_or_request_with_http_basic do |username, password|
      secure_password = BCrypt::Password.new("$2a$10$hWH1UNaxbEg.koVC3PBdeeHhxdu7it7swsCUn/X4yk6qR/fS/R5fm")

      username == "ubpb" && secure_password == password
    end
  end

end
