class UsersController < ApplicationController


  def create
    @user = User.find_by(username: params["username"])
    if @user && @user.authenticate(params["password"])
      render "create.json.jbuilder", status: :created
    else
      render json: { error: "User or password incorrect. So sorry you aren't getting in!" },
             status: :unauthorized

    end
  end

  def new
    @user = User.new(username: params["username"],
                      fullname: params["fullname"],
                      email: params["email"],
                      password: params["password"])
    if @user.save
      render "new.json.jbuilder", status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

end