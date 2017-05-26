class PhotosController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @photo = @event.photos.new
  end

  # POST /photos
  def create
    @event  = Event.find(params[:event_id])
    @photo = @event.photos.new(photo_params)

    if @photo.save
      redirect_to root_path, notice: 'Photo was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @photo = @event.photos.find(params[:id])
    @photo.destroy
    redirect_to root_path, notice: 'Photo was successfully destroyed.'
  end

  def favorite
    @event = Event.find(params[:event_id])
    @photo = @event.photos.find(params[:id])

    Favorite.create(photo: @photo, user: current_user)
  end

  def unfavorite
    @event = Event.find(params[:event_id])
    @photo = @event.photo.find(params[:id])

    favorite = Favorite.find_by(photo: @photo, user: current_user)
    favorite.destroy

    Rails.logger.info "UNFAVORITING ITEM #{@photo.name}"
  end


  private

  # Only allow a trusted parameter "white list" through.
  def photo_params
    params.require(:photo).permit(:image)
  end
end
