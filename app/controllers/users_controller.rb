class UsersController < ApplicationController

  before_filter :require_user, :only => [:edit, :update, :index]
  before_filter :set_user, :only => [:show, :edit, :update]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default profile_url
    else
      render :action => :new
    end
  end
  
  def show
  end

  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to profile_url
    else
      render :action => :edit
    end
  end

  protected
    def set_user
      if not params[:id].blank?
        @user = User.find_by_login(params[:id])
      else
        @user = current_user
      end
      if not @user
        flash[:notice] = "User profile can not be found."
        redirect_to root_path
      end
      
    end
end
