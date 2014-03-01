class EventReport < Struct.new(:event, :query_values)
  def lowest_price_by_day
    Util.grouped_cents_to_dollars ticket_prices.
      group_by_day("batches.scraped_at").
      minimum("ticket_prices.price_cents")
  end

  def lowest_price_last_24_hours
    Util.grouped_cents_to_dollars ticket_prices.
      group_by_hour("batches.scraped_at", Time.zone, last_24_hours).
      minimum("ticket_prices.price_cents")
  end

  private

  def ticket_prices
    query = event.ticket_prices

    if query_values[:sections].any?
      query = query.where(
        "lower(ticket_prices.section) IN (?)",
        query_values[:sections].map(&:downcase),
      )
    end

    if query_values[:quantity] > 0
      query = query.
        where("ticket_prices.quantity_min <= ?", query_values[:quantity]).
        where("ticket_prices.quantity_max >= ?", query_values[:quantity])
    end

    query
  end

  def last_24_hours
    if Time.now > event.stop_scraping_at
      (event.stop_scraping_at - 24.hours)..event.stop_scraping_at
    else
      24.hours.ago..Time.now
    end
  end

  module Util
    def self.grouped_cents_to_dollars(group)
      group.each_with_object({}) { |(k, v), obj| obj[k] = v / 100.0 }
    end
  end
end
