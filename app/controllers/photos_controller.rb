class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
before_action :admin_user, only: [:index, :show, :edit, :update, :destroy]
  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  def play
    if(params.has_key?(:difficulty))
    @difficulty = params[:difficulty]
    else 
      @difficulty = 20
    end
    @allphotos = Photo.all
    @random = 1+rand(Photo.count)
    @pic1 = Photo.find_by(id: @random)
    if @pic1
    @photos = Photo.where(:tags => @pic1.tags)
  else
    redirect_to play_path
  end
    end
      # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  def checkanswer
    @answer = params[:answer]
    @photoid = params[:photoid]
    user = User.find_by(id: current_user.id)
    @photo = Photo.find_by(id: @photoid)
     if @answer == @photo.tags
      user.update(score: user.score+3)
    @message = 'Correct answer! :D'
    else
    user.update(score: user.score-1)
    @message = 'Wrong Answer :('
    end
    redirect_to play_path, notice: @message
  end
  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:tags, :picture)
    end
     def admin_user
      redirect_to(home_url) unless current_user.admin?
    end
end
