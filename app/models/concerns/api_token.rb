module Concerns
  module ApiToken
    extend ActiveSupport::Concern

    def sign_in_user
      update_attributes(api_token: SecureRandom.uuid)
    end

    def sign_out_user
      update_attributes(api_token: nil)
    end

    def issue_token
      JWT.encode({user_id: id, api_token: api_token}, Rails.application.secrets.secret_key_base)
    end

    module ClassMethods
      def api_user(token)
        begin
          decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
          user = User.find(decoded_token['user_id'])
          user if user.try(:api_token) == decoded_token['api_token']
        rescue
          nil
        end
      end
    end

  end
end