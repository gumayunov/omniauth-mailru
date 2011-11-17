# Sample app for Google OAuth2 Strategy
# Make sure to setup the ENV variables GOOGLE_KEY and GOOGLE_SECRET
# Run with "bundle exec rackup"

require 'rubygems'
require 'bundler'
require 'sinatra'
require 'omniauth'
require 'omniauth-mailru'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class App < Sinatra::Base
  get '/' do
    <<-HTML
    <ul>
      <li><a href='/auth/mailru'>Sign in with Mail.ri</a></li>
    </ul>
    HTML
  end

  get '/auth/:provider/callback' do
    content_type 'text/plain'
    request.env['omniauth.auth'].to_hash.inspect
  end
  
  get '/auth/failure' do
    content_type 'text/plain'
    request.env['omniauth.auth'].to_hash.inspect
  end
end

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :mailru, ENV['MAILRU_KEY'], ENV['MAILRU_PRIVATE_KEY'], {
    :authorize_options => {
      # optional
      :callback_url => ENV['MAILRU_CALLBACK_URL']
    }
  }
end

run App.new


