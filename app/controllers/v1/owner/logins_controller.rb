class V1::Owner::LoginsController < ApplicationController
  skip_before_action :authenticate_owner

  def create
    FirebaseIdToken::Certificates.request
    raise ArgumentError, 'BadRequest Parameter' if payload.blank?

    if owner = Owner.find_by(logins_params.merge(uid: payload['sub']))
      render json: owner, serializer: OwnerSerializer, status: :created
    else
      unauthorized
    end
  end

  private

  def token_from_request_headers
    request.headers['Authorization']&.split&.last
  end

  def token
    params[:token] || token_from_request_headers
  end

  def payload
    @payload ||= FirebaseIdToken::Signature.verify token
  end


  def logins_params
    params.require(:login).permit(:email, :password)
  end
end
