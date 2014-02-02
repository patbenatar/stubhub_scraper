class AddOccursAtToEvents < ActiveRecord::Migration
  def change
    add_column :events, :occurs_at, :datetime
  end
end
