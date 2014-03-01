class EventReportForm
  include ActiveAttr::Model

  attribute :section
  attribute :quantity, type: Integer
end
