class PagesController < ApplicationController
  load_and_authorize_resource :user, :parent => false
  # GET /pages
  # GET /pages.json
  def index
    @users = User.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    # @comments = @page.comments
  end
  # GET /pages/new
  def new
    # @page = page.new
  end

  # GET /pages/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # page /pages
  # page /pages.json
  def create
    # @page = page.new(page_params)
    @page.user = current_user

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @user.update(page_params)
        format.html { redirect_to pages_path, notice: 'page was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
     @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      # @page = page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:user).permit(:name, :email, :role)
    end
end
