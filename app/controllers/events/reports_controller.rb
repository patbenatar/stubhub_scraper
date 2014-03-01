class Events::ReportsController < ApplicationController
  helper_method :event, :event_report_form, :event_report

  def new
    event_report_form.sections = "Upper Center 333"
    event_report_form.quantity = 2
  end

  def create
    render :new unless event_report_form.valid?
  end

  private

  def event
    @event ||= Event.find(params[:event_id])
  end

  def event_report_form
    @event_report_form ||= EventReportForm.new(params[:event_report_form])
  end

  def event_report
    @event_report ||= EventReport.new(
      event,
      event_report_form.cleansed_attributes,
    )
  end
end
