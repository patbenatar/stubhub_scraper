class Event < ActiveRecord::Base
  has_many :batches
  has_many :ordered_batches, class_name: "Batch", order: "scraped_at DESC"

  scope :active, -> { where("start_scraping_at <= :now AND stop_scraping_at >= :now", now: Time.now) }
end
