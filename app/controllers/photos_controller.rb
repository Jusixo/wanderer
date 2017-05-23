class PhotosController < ApplicationController
  # POST /photos
  def create
    @event  = Event.find(params[:event_id])
    @photo = @event.photos.new(photo_params)

    if @photo.save
      redirect_to @photo.event, notice: 'Photo was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @photo = @event.photos.find(params[:id])
    @photo.destroy
    redirect_to event_path(@event), notice: 'Photo was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def photo_params
    params.require(:photo).permit(:image)
  end
end
