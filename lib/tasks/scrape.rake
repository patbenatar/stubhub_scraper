desc "Scrape StubHub for ticket prices"
task scrape: :environment do
  Event.active.find_each(batch_size: 100) do |event|
    puts "Scraping #{event.name}"

    scraper = Scraper.new(event.path)
    scraper.scrape

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
