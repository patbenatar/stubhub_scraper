class EventsController < ApplicationController
  helper_method :events, :event

  def index; end
  def show; end

  private

  def events
    @events ||= Event.order("stop_scraping_at DESC")
  end

  def event
    @event ||= Event.find(params[:id])
  end
end
