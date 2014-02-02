class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.datetime :scraped_at
      t.references :event, index: true

      t.timestamps
    end
  end
end
