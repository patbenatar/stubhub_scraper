class Event < ActiveRecord::Base
  has_many :batches
  has_many :ordered_batches, -> { order("scraped_at DESC") }, class_name: "Batch"
  has_many :ticket_prices, through: :batches

  scope :active, -> { where("start_scraping_at <= :now AND stop_scraping_at >= :now", now: Time.now) }
end
