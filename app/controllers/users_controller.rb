class UsersController < ApplicationController
end

def show
  @user = User.find(params[:id])
end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)

  if @user.save
    redirect_to user_path(@user), notice: "User was successfully added."
  else
    render :new, status: :unprocessable_entity
  end
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])

  if @user.update(user_params)
    redirect_to user_path(@user)
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to users_path, status: :see_other
end
