class AddReferrerIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :referrer_id, :integer
  end
end
