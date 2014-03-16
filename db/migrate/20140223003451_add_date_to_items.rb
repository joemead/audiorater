class AddDateToItems < ActiveRecord::Migration
  def change
    add_column :items, :date, :string
  end
end
