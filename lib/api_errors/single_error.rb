require_relative 'base_error'

module ApiErrors
  class SingleError < BaseError
    def initialize(name, status_code, message, slug, details = {})
      super(name,
        status_code,
        message,
        [{
          message: message,
          slug: slug,
          details: details,
        }])
    end
  end
end