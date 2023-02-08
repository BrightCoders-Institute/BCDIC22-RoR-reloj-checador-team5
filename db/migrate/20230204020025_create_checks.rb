class CreateChecks < ActiveRecord::Migration[7.0]
  def change
    create_table :checks do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.datetime :datetime
      t.string :check
      
      t.timestamps
    end
  end
end
