require_relative 'single_error'

module ApiErrors
  class BadRequest < SingleError
    def initialize(message, slug)
      super 'bad-request', 400, message, slug
    end
  end
end