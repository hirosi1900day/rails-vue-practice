module Jwt::UserAuthenticator
    extend self

    def call(request_headers)
        @request_headers = request_headers
        payload = Jwt::TokenDecryptor(token)
        User.find(payload['user_id'])
    end

    private
    def token
        @request_headers['Authorization'].splite(' ').last
    end
end