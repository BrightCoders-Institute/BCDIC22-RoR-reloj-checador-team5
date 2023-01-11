class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :email
      t.string :name
      t.string :position
      t.string :employee
      t.string :private

      t.timestamps
    end
  end
end
