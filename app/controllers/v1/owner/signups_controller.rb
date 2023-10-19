class V1::Owner::SignupsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def create

    response = request_signup!
    puts response.inspect
    uid = response.body['localId']
    email = response.body['email']

    owner = Owner.create!(signup_params.merge(uid: uid))
  rescue StandardError => e
    request_account_delete!(response.body['idToken']) if uid.present?
    render_error message: e, status: :internal_server_error
    end
  end

  private

  def signup_params
    params.permit(:email, :password, :last_name, :first_name, :phone_number)
  end

  def request_signup!
    params = { email: signup_params['email'], password: signup_params['password'], returnSecureToken: true }
    conn = connection
    conn.post("/v1/accounts:signUp?key=AIzaSyB4ZtabU2lIJ-IbDgeAoPlOVTYYzTZwBCY") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = params.to_json
    end

  end

  def connection
    Faraday.new('https://identitytoolkit.googleapis.com') do |faraday|
      faraday.response :raise_error
      faraday.response :json
    end
  end

  def request_account_delete!(id_token)
    params = { idToken: id_token }
    conn = connection
    conn.post("/v1/accounts:delete?key=#{ENV['FIREBASE_API_KEY']}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = params.to_json
    end
  end

end
