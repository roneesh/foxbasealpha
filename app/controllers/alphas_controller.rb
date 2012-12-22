class AlphasController < ApplicationController
  # GET /alphas
  # GET /alphas.json
  def index
    @public_alphas = Alpha.where(:isprivate => false)

    whitelist = Whitelist.where(user_id: session[:user_id]).to_a
    @private_alphas = []
    whitelist.each do |whitelist_entry|
      if Alpha.find_by_id(whitelist_entry.alpha_id).isprivate == true
        @private_alphas << Alpha.find_by_id(whitelist_entry.alpha_id)
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @alphas }
    end
  end

  # GET /alphas/1
  # GET /alphas/1.json
  def show
    @alpha = Alpha.find(params[:id])
    @microposts = @alpha.microposts
    whitelist = Whitelist.where(alpha_id: @alpha.id)

    @users = []
    whitelist.each do |list_entry|
      @users << User.find_by_id(list_entry.user_id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @alpha }
    end
  end

  # GET /alphas/new
  # GET /alphas/new.json
  def new
    @alpha = Alpha.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alpha }
    end
  end

  # GET /alphas/1/edit
  def edit
    @alpha = Alpha.find(params[:id])
  end

  # POST /alphas
  # POST /alphas.json
  def create
    user = User.find_by_id(session[:user_id])
    @alpha = Alpha.new(params[:alpha])
    @alpha.admin_id = User.find_by_email(user.email)

    respond_to do |format|
      if @alpha.save
        format.html { redirect_to @alpha, notice: 'Alpha was successfully created.' }
        format.json { render json: @alpha, status: :created, location: @alpha }
      else
        format.html { render action: "new" }
        format.json { render json: @alpha.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /alphas/1
  # PUT /alphas/1.json
  def update
    @alpha = Alpha.find(params[:id])

    respond_to do |format|
      if @alpha.update_attributes(params[:alpha])
        format.html { redirect_to @alpha, notice: 'Alpha was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @alpha.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alphas/1
  # DELETE /alphas/1.json
  def destroy
    @alpha = Alpha.find(params[:id])
    @alpha.destroy

    respond_to do |format|
      format.html { redirect_to alphas_url }
      format.json { head :no_content }
    end
  end

  def new_alpha_user
    @whitelist = Whitelist.new
    @alpha_id = params[:alpha_id]
    @users = User.all
  end

  def new_alpha_user_create
    Whitelist.create(user_id: params[:whitelist][:user_id], alpha_id: params[:whitelist][:alpha_id])

    respond_to do |format|
      format.html { redirect_to alpha_url(params[:alpha_id])}
    end
  end


end
