class PagesController < ApplicationController
  layout false
  def landing
    @event = Event.first
    @events = Event.all
  end

  def index
  end
end
