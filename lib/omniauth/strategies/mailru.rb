require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies

    # Authenticate to Mail.ru utilizing OAuth 2.0
    #   http://api.mail.ru/docs/guides/oauth/sites/

    class Mailru < OmniAuth::Strategies::OAuth2
      option :name, "mailru"

      option :client_options, {
        :site => 'https://connect.mail.ru/',
        :token_url     => '/oauth/token',
        :authorize_url => '/oauth/authorize'
      }

      option :callback_url

      uid do
        access_token.params['x_mailru_vid']
      end

      info do
        {
          :nickname => raw_info['nick'],
          :email => raw_info['email'],
          :name => [raw_info['first_name'], raw_info['last_name']].join(' '),
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :image => (raw_info['has_pic'].to_s != "0") && raw_info['pic_big'] || nil,
          :location => (raw_info['location'] || {})['name'],
          :urls => {
            'Mailru' => raw_info['link']
          }
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def callback_url
        options.callback_url || super
      end

      private

      def raw_info
        @raw_info ||= begin
          params = {
            :method => 'users.getInfo',
            :app_id => options.client_id,
            :session_id => access_token.token,
            :format => "json"
          }
          params[:sig] = calc_signature(params)
          result = access_token.get('http://appsmail.ru/platform/api', :params => params).parsed.first
          result
        end
      end

      def calc_signature(hash)
        raw = hash.map{|key, value| [key, value].join('=')}.sort.join
        raw = [uid, raw, options.client_secret].join
        Digest::MD5.hexdigest(raw)
      end

    end

  end
end
