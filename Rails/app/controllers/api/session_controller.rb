class Api::SessionController < ApplicationController
    def create 
        user = User.find_by(session_params['email'])
        if user && user.authenticate(session_params['password'])
            Jwt::TokenProvider.call({user_id: user.id})
            render json: ActiveModelSerializers::SerializableResource.new(user, serializer: UserSerializer).as_json.deep_merge(user: { token: token })
        else
            render json: { error: { messages: ['メールアドレスまたはパスワードに誤りがあります。'] } }, status: :unauthorized
        end
    end

    private
    def session_params
        params.require(:session).permit(:email, :password)
    end
end
