class CreateTicketPrices < ActiveRecord::Migration
  def change
    create_table :ticket_prices do |t|
      t.references :batch, index: true
      t.integer :price_cents
      t.string :section
      t.integer :row
      t.integer :quantity_min
      t.integer :quantity_max

      t.timestamps
    end
  end
end
