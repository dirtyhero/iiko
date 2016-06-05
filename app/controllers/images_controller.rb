class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    # todo 最適化された順番で取得
    unless params[:image_id].present?
      @image = Image.find(rand(1..1800))
    else
      @image = Image.find(params[:image_id])
    end

    @like = Like.find_by user_id: current_user.id, image_id: @image.id
    @like = Like.new unless @like.present?
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:url)
    end
end
