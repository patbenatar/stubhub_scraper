require "capybara/dsl"

Capybara.run_server = false
Capybara.current_driver = :webkit
Capybara.app_host = "http://www.stubhub.com/"

class Scraper
  include Capybara::DSL

  attr_reader :path, :tickets_data

  def initialize(path)
    @path = path
    @tickets_data = []
  end

  def scrape
    visit path

    begin
      find("#vmi2boxclose").click # close marketing modal
    rescue Capybara::ElementNotFound; end

    # scroll to prompt JS to render the views we care about
    page.execute_script "window.scrollBy(0,10000)"

    pagination_form = find("#ticketListTable_go")
    total_pages = pagination_form.find(".nrPages").text.gsub(/\D/, "").to_i

    (1..total_pages).each do |page_num|
      puts "---- PAGE #{page_num}"

      pagination_form.find("input").set page_num
      pagination_form.click_button "Go"

      trs = all("#ticketListTable tbody tr")
      trs.each do |tr|
        begin
          section = tr.find(".sectionName").text
          next if section.downcase == "parking" # ignore parking

          data = {
            section: section,
            row: tr.find(".ticketRow").text,
            quantity_range: tr.find(".ticketQty").text,
            price: tr.find(".q_cont .q").text,
          }
          tickets_data << data
        rescue Capybara::ElementNotFound; end
      end
    end
  end
end
