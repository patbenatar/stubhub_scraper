class Batch < ActiveRecord::Base
  belongs_to :event
  has_many :ticket_prices
  has_many :ordered_ticket_prices, class_name: "TicketPrice", order: "price_cents ASC"
end
