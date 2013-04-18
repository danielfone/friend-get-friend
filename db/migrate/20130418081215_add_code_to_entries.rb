class AddCodeToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :code, :string
  end
end
