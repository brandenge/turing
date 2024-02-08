require 'securerandom'

class Api::V0::UsersController < ApplicationController
  def create
    if valid_create?
      api_key = SecureRandom.base64
      new_user = User.create(email: params[:email], password: params[:password], api_key: api_key)

      render json: UserSerializer.new(new_user).serializable_hash.to_json, status: 201
    end
  end

  def login
    if valid_login?
      user = User.find_by(email: params[:email])
      session[:user_id] = user.id
      render json: UserSerializer.new(user).serializable_hash.to_json, status: 200
    end
  end

  private

  def valid_create?
    if params[:email].blank? ||
      params[:password].blank? ||
      params[:password_confirmation].blank?
      raise CustomError.new('Invalid request. Missing one or more request fields.', 400)
    elsif params[:password] != params[:password_confirmation]
      raise CustomError.new('Invalid request. The password and password confirmation do not match.', 422)
    elsif User.find_by(email: params[:email])
      raise CustomError.new('Invalid request. Another registered user has already taken that email address', 409)
    else
      true
    end
  end

  def valid_login?
    user = User.find_by(email: params[:email])

    if params[:email].blank? || params[:password].blank?
      raise CustomError.new('Invalid request. Missing one or more request fields.', 400)
    elsif !user || !user.authenticate(params[:password])
      raise CustomError.new('Invalid request. The password and password confirmation do not match.', 401)
    else
      true
    end
  end
end
