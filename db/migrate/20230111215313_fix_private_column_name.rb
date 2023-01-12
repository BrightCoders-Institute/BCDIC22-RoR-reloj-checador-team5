class FixPrivateColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :employees, :private, :number_private
  end
end
