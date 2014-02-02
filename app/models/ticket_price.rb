class TicketPrice < ActiveRecord::Base
  belongs_to :batch

  monetize :price_cents

  def quantity
    return quantity_min if quantity_min == quantity_max
    "#{quantity_min}-#{quantity_max}"
  end
end
