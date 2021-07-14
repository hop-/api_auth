module ApiErrors
  class BaseError < StandardError
    include ActiveModel::Serialization
    attr_reader :name, :status, :message, :errors

    def initialize(name, status_code, message, errors)
      @name = name
      @status = status_code
      @message = message
      @errors = errors
    end
  end
end