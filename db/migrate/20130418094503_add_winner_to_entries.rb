class AddWinnerToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :winner, :boolean
  end
end
