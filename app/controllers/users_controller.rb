class UsersController < ApplicationController

  def create

  end

  def new
    @user = User.new(username: params["username"],
                      fullname: params["fullname"],
                      email: params["email"],
                      password: params["password"])
    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

end