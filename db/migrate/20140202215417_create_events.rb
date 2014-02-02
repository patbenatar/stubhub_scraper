class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :path
      t.datetime :start_scraping_at
      t.datetime :stop_scraping_at

      t.timestamps
    end
  end
end
