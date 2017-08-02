class PhotosController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @photo = @event.photos.new
  end

  # For this to work you need to have
  #
  # youtube-dl
  # and
  # ffmpeg
  #
  # installed (via homebrew?)
  def grab
    thumbnail_temp_path = Tempfile.new.path

    %x{
      ffmpeg -y -headers "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7^M\012Accept-Language: en-us,en;q=0.5^M\012Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8^M\012User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/47.0 (Chrome)^M\012" \
        -i $(youtube-dl https://youtu.be/https://AuBEBvfRUKE --get-url) \
        -ss 00:00:01.500 -f image2 -vframes 1 #{thumbnail_temp_path}
    }

    @event = Event.find(params[:event_id])
    @photo = @event.photos.new(image: File.open(thumbnail_temp_path))

    if @photo.save
      redirect_to @event, notice: 'Photo was successfully added.'
    else
      redirect_to @event, notice: 'Photo was NOT added.'
    end
  end

  # POST /photos
  def create
    @event = Event.find(params[:event_id])
    @photo = @event.photos.new(photo_params)

    if @photo.save
      redirect_to @event, notice: 'Photo was successfully added.'
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
    NotificationsMailer.favorite(photo, curret_user).deliver_later
  end

  def unfavorite
    @event = Event.find(params[:event_id])
    @photo = @event.photos.find(params[:id])

    favorite = Favorite.find_by(photo: @photo, user: current_user)
    favorite.destroy

    Rails.logger.info "UNFAVORITING #{@photo.id}"
  end


  private

  # Only allow a trusted parameter "white list" through.
  def photo_params
    params.require(:photo).permit(:image)
  end
end
