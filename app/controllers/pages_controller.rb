class PagesController < ApplicationController
  layout false
  def landing
    @event = Event.first
  end

  def index
  end
end
