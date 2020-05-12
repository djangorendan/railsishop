class Admin::AppImagesController < ApplicationController
  layout "admin"

  before_action :authenticate_admin!
  before_action :set_app_image, only: [:show, :edit, :update, :destroy]

  # GET /app_images
  # GET /app_images.json
  def index
    @app_images = AppImage.all
  end

  # GET /app_images/1
  # GET /app_images/1.json
  def show
  end

  # GET /app_images/new
  def new
    @app_image = AppImage.new
  end

  # GET /app_images/1/edit
  def edit
  end

  # POST /app_images
  # POST /app_images.json
  def create
    @app_image = AppImage.new(app_image_params)

    respond_to do |format|
      if @app_image.save
        format.html { redirect_to admin_app_images_path, notice: 'App image was successfully created.' }
        format.json { render :show, status: :created, location: @app_image }
      else
        format.html { render :new }
        format.json { render json: @app_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_images/1
  # PATCH/PUT /app_images/1.json
  def update
    respond_to do |format|
      if @app_image.update(app_image_params)
        format.html { redirect_to admin_app_images_path, notice: 'App image was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_image }
      else
        format.html { render :edit }
        format.json { render json: @app_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_images/1
  # DELETE /app_images/1.json
  def destroy
    @app_image.destroy
    respond_to do |format|
      format.html { redirect_to admin_app_images_path, notice: 'App image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_image
      @app_image = AppImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_image_params
      params.require(:app_image).permit(:name, :image)
    end
end
