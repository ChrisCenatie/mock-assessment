class AddColumnToLink < ActiveRecord::Migration
  def change
    add_column :links, :read_status, :integer, default: 0
  end
end
