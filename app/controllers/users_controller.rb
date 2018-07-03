class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]

	def update
		if @user.update(user_params)
			flash[:notice] = "user was successfully created"
			redirect_to user_path(current_user)
		else
			flash.now[:alert] = "user was failed to create"
			render :edit
		end
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :intro, :avatar)
	end
end
