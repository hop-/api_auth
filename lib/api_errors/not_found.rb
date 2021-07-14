require_relative 'single_error'

module ApiErrors
  class NotFound < SingleError
    def initialize(message, path)
      super 'not-found', 404, message, "#{path}-not-found", {path: path}
    end
  end
end