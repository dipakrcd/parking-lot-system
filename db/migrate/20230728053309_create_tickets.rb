class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.references :car, foreign_key:true
      t.timestamps
    end
  end
end
