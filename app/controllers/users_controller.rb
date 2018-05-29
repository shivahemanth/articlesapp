class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  skip_before_action :check_login
  
  def show
    @user = User.find(params[:id])
  end

  def new
  	 @user = User.new
  end

  def signup
    @user = User.new
  end  

  def add_new_user

  end  

  def edit
    @user = User.find(params[:id])
  end  

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

def create
    @user = User.new(user_params)
    if @user.save
      #log_in @user
      flash[:success] = "Your account has been created"
      redirect_to @user
    else
      render 'new'
    end
  end

private

    def user_params
      params.require(:user).permit(:first_name, :last_name,  :email, :password,
                                   :password_confirmation, umetas_attributes: [:meta_keys, :meta_values], avatars: [])
    end

    def set_user
      @user = User.find(params[:id])
    end

end
