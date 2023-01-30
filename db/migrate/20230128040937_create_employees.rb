class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.belongs_to :company, index: true, null: false, foreign_key: true
      t.integer :employee
      t.string :email
      t.string :name
      t.string :position
      t.integer :number_private
      t.boolean :is_employee
      t.timestamps
    end
  end
end
