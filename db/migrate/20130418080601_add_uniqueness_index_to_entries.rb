class AddUniquenessIndexToEntries < ActiveRecord::Migration
  def change
    add_index :entries, :email, unique: true
  end
end