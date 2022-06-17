class UserCreate < ApplicationService
	def initialize(username:, password:)
		@username = username
		@password = password
	end

	def call
		create_user
	end

	private
  
	def create_user
		User.create(
			username: @username
			password: @password
		)

		rescue ActiveRecord::RecordNotUnique => e
			# handle duplicate entry
		end

		if @user.valid?
			token = encode_token({user_id: @user.id})
			render json: {user: @user, token: token},
			status: :ok
		else
			render json: {error: 'This username already exists or the password does not meet the minimum requirements!'},
			status: :unprocessable_entity
		end
	end
end
