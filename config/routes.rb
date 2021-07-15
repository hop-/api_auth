Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api/v1/oauth' do
    post 'register', to: 'oauth#register'
    post 'login', to: 'oauth#login'
    post 'login/google', to: 'oauth#login-with-google'
    post 'logout', to: 'oauth#delete_token'
    post 'refresh-token', to: 'oauth#refresh_token'
    post 'activation_token', to: 'oauth#regenerate_activation_token'
    get 'authenticate', to: 'oauth#authenticate'
  end
end
