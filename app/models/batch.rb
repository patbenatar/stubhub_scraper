class Batch < ActiveRecord::Base
  belongs_to :event
  has_many :ticket_prices
  has_many :ordered_ticket_prices, -> { order("price_cents ASC") }, class_name: "TicketPrice"
end
