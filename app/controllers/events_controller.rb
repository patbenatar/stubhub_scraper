class EventsController < ApplicationController
  helper_method :events, :event, :event_form

  def index; end

  def show
    @batches = event.ordered_batches.page(params[:page]).per(100)
  end

  def new; end

  def create
    if event_form.valid? && event.update_attributes(event_form_attributes)
      redirect_to events_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if event_form.valid? && event.update_attributes(event_form_attributes)
      redirect_to events_path
    else
      render :edit
    end
  end

  private

  def events
    @events ||= Event.order("stop_scraping_at DESC")
  end

  def event
    @event ||= params[:id] ? Event.find(params[:id]) : Event.new
  end

  def event_form
    @event_form ||= EventForm.new.tap do |form|
      form.attributes = event.attributes
      form.attributes = params[:event_form]
    end
  end

  def event_form_attributes
    permit_form_attributes(
      event_form,
      :name, :path, :occurs_at, :start_scraping_at, :stop_scraping_at
    )
  end

  def permit_form_attributes(form, *attributes)
    attributes.each_with_object({}) do |attribute, obj|
      obj[attribute] = form.public_send(attribute)
    end
  end
end
