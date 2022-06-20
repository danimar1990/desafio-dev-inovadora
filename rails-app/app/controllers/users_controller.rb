class UsersController < ApplicationController

	def create
		UserService.new().create_user(
			params[:username],
			params[:password],
			params[:firstname],
			params[:lastname],
			params[:email]
		)
		render json: {username: params[:username], firstname: params[:firstname], lastname: params[:lastname], email: params[:email]},
		status: :ok
	end

    def login
        user = UserService.new().login()
    end

end
