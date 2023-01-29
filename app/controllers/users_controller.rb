class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index 
		users = User.order('id DESC')
		render json: users
	end

	def show
		user = User.find(params[:id])
		render json: user
	end

	def create
		@user = User.new(user_params.merge({user_id: 1}))

	  if @user.save
	    render json: @user, status: :created
	  else
	    render json: @user.errors, status: :unprocessable_entity
	  end
	end

	def update
	  @user = User.find(params[:id])
	  if @user.update(user_params)
	    render json: @user
	  else
	    render json: @user.errors, status: :unprocessable_entity
	  end
	end

	private

	def user_params
	  params.require(:user).permit(:lastname, :name, :patronymic, :company)
	end

end
