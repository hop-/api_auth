require_relative 'single_error'

module ApiErrors
  class ResourceExists < SingleError
    def initialize(message, path)
      super 'resource-exists', 409, message, "#{path}-exists", {path: path}
    end
  end
end