class V1::Owner::BasesController < ApplicationController
  include ActionController::Cookies
  include OwnerUserAuthenticatable
  include Firebase::Auth::Authenticable

  before_action :authenticate_owner
end
