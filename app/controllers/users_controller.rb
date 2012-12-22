class UsersController < ApplicationController
  # GET /users
  # GET /users.json

  before_filter :ensure_correct_user, only: [:show, :edit, :update]
  before_filter :ensure_site_admin, only: [:index, :new, :destroy]

  def ensure_correct_user
      if session[:user_id] != params[:id].to_i
        flash[:message] = "You are not authorized to see/edit/delete any other User's information."
        redirect_to user_url(session[:user_id])
    end
  end

  def ensure_site_admin
    user = User.find_by_id(session[:user_id])
      if !user.site_admin
        flash[:message] = "User list only available to admins"
        redirect_to user_url(session[:user_id])        
    end
  end

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(session[:user_id])
    @user_microposts = Micropost.where(user_id: session[:user_id])
    @alphas_for_microposts = []

    @user_microposts.each do |user_micropost|
      @alphas_for_microposts << Alpha.find_by_id(user_micropost.alpha_id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
