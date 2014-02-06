class EventForm
  include ActiveAttr::Model
  include Forms::DateAndTimeField

  attribute :name
  attribute :path
  date_and_time_field :occurs_at, validates: { presence: true }
  date_and_time_field :start_scraping_at, validates: { presence: true }
  date_and_time_field :stop_scraping_at, validates: { presence: true }

  validates :name, :path, presence: true
end
