class EventScraper
  include Sidekiq::Worker

  def perform(event_id)
    event = Event.find(event_id)

    logger.info "Preparing to scrape Event #{event.id}: #{event.name}"

    scraper = Scraper.new(event.path)
    scraper.scrape

    ActiveRecord::Base.transaction do
      batch = event.batches.create(scraped_at: Time.now)

      scraper.tickets_data.each do |ticket_data|
        if ticket_data[:quantity_range].index("-")
          quantity_min, quantity_max = ticket_data[:quantity_range].split("-")
        else
          quantity_min = quantity_max = ticket_data[:quantity_range]
        end

        batch.ticket_prices.create(
          price: ticket_data[:price],
          section: ticket_data[:section],
          row: ticket_data[:row],
          quantity_min: quantity_min,
          quantity_max: quantity_max,
        )
      end
    end
  end
end
