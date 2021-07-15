require_relative 'single_error'

module ApiErrors
  class AuthenticationError < SingleError
    def initialize()
      super 'authentication-error', 403, 'Invalid credentials', 'authentication-failed', { path: 'authentication' }
    end
  end
end