require "#{Rails.root}/lib/api_errors/bad_request"

class UserValidator < ActiveModel::Validator
  def validate(record)
    raise ApiErrors::BadRequest.new("Missing field 'email'", 'user') unless record.email
    raise ApiErrors::BadRequest.new("Incorrect format 'email'", 'user') unless record.email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    raise ApiErrors::BadRequest.new("Missing field 'password'", 'user') unless record.password
    raise ApiErrors::BadRequest.new("Missing field 'client_id'", 'user') unless record.client_id
  end
end

class User < ApplicationRecord
  has_secure_password
  belongs_to :client
  validates_with UserValidator

  def as_json(options={})
    options[:except] ||= [:password_digest]
    super(options)
  end
end
