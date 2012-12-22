class MicropostsController < ApplicationController
  # GET /microposts
  # GET /microposts.json
  def index
    @user = User.find_by_id(session[:user_id])
    @microposts = @user.microposts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @microposts }
    end
  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show
    @micropost = Micropost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @micropost }
    end
  end

  # GET /microposts/new
  # GET /microposts/new.json
  def new
    @micropost = Micropost.new
    @user_id = session[:user_id]
    public_alphas = Alpha.where(:isprivate => false)

    whitelist = Whitelist.where(user_id: session[:user_id]).to_a
    private_alphas = []
    whitelist.each do |whitelist_entry|
      if Alpha.find_by_id(whitelist_entry.alpha_id).isprivate == true
        private_alphas << Alpha.find_by_id(whitelist_entry.alpha_id)
      end
    end

    @alphas = public_alphas + private_alphas 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @micropost }
    end
  end

  # GET /microposts/1/edit
  def edit
    @micropost = Micropost.find(params[:id])
    @user_id = @micropost.user_id
  end

  # POST /microposts
  # POST /microposts.json
  def create
    @micropost = Micropost.new(params[:micropost])
    @micropost.user_id = session[:user_id]

    respond_to do |format|
      if @micropost.save
        format.html { redirect_to user_microposts_path(@micropost.user.id), notice: 'Micropost was successfully created.' }
        format.json { render json: @micropost, status: :created, location: @micropost }
      else
        format.html { render action: "new" }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /microposts/1
  # PUT /microposts/1.json
  def update
    @micropost = Micropost.find(params[:id])

    respond_to do |format|
      if @micropost.update_attributes(params[:micropost])
        format.html { redirect_to user_micropost_path(@micropost.user_id, @micropost.id), notice: 'Micropost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy

    respond_to do |format|
      format.html { redirect_to user_microposts_path(@micropost.user_id) }
      format.json { head :no_content }
    end
  end
end
