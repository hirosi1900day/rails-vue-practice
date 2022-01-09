module Jwt::TokenDecryptor
    extend self

    def call(token)
        decript(token)
    end

    private

    def decript(token)
       JWT.decode(token, Rails.application.credentials.secret_key_base) 

    rescue StandardError
        raise InvalidTokenError
    end
    class InvalidTokenError < StandardError; end
end