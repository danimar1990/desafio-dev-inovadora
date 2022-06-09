class UsersController < ApplicationController

    def create
        @user = User.create(user_params)
        if @user.valid?
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}, status: :ok
        else
            render json: {error: 'This username already exists or the password does not meet the minimum requirements!'},
            status: :unprocessable_entity
        end
    end

    def login
        @user = User.find_by(username: user_params[:username])
        
        if @user && @user.authenticate(user_params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}, status: :ok
        else
            render json: {error: 'Username or password invalid!'},
            status: :unprocessable_entity
        end
    end

	def logout
		user = User.find(params[:id])
		user.destroy
		render json: {status: 'SUCCESS', message:'The user has ben removed!', data:user},status: :ok
	end

    private

    def user_params
        params.permit(:username, :password)
    end

end
