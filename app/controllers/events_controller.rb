class EventsController < ApplicationController
  # GET /events
  def index
    redirect_to root_path
  end

  # GET /events/1
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    @event.admin = current_admin

    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  def favorite
  # talk to AJAX server.
  # record the house_id, user_id, and log them.
  # return a favorite class name that will change the heart red the next time it is loaded, or standard class if not the favorite.
  end


  private

  # Only allow a trusted parameter "white list" through.
  def event_params
    params.require(:event).permit(:event_name, :web_link, :image, :event_info, :photos)
  end
end
