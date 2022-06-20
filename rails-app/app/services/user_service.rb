class UserService

	def create_user(username, password, firstname, lastname, email)
		user = User.create(
			username: username,
			password: password,
			firstname: firstname,
			lastname: lastname,
			email: email
		)

		if user.valid?
			token = encode_token({id: user.id, firstname: user.firstname, lastname: user.lastname, email: user.email})
		end
	end

	def login
        user = User.find_by(user)
        
        if user && user.authenticate(user.password)
            token = encode_token({id: user.id})
        end
    end

    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end

    def decode_token
        auth_header = request.headers['Authorization']
        if auth_header
            token = auth_header.split(' ').last
            begin
                JWT.decode(token, 'secret', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def authorized_user
        decoded_token = decode_token()
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def authorize
        render json: {message: 'You are not logged or your API KEY is missing or invalid!'},
		status: :unauthorized unless authorized_user
    end
end
