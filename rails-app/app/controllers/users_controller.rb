class UsersController < ApplicationController

	def create
		UserCreate.call(params[:username], params[:password])
	end

    def login
        @user = User.find_by(username: user_params[:username])
        
        if @user && @user.authenticate(user_params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token},
			status: :ok
        else
            render json: {error: 'Invalid credentials or username not exists!'},
            status: :unprocessable_entity
        end
    end

	def logout
		user = User.find(params[:id])
		user.destroy
		render json: {status: 'SUCCESS', message:'The user has been removed!', data:user},status: :ok
	end

    private

    def user_params
        params.permit(:username, :password)
    end

end
