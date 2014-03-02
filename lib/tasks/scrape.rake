desc "Scrape StubHub for ticket prices"
task scrape: :environment do
  Event.active.pluck(:id).each do |event_id|
    puts "Queuing scrape of Event #{event_id}"
    EventScraper.perform_async(event_id)
  end
end
