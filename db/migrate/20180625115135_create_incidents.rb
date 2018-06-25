class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.string :medication_name
      t.string :dose
      t.string :period
      t.string :side_effect
      t.text :description
      t.integer :metric
      t.date :date_medication_received
      t.date :date_of_incident

      t.references :parent, foreign_key: true


      t.timestamps
    end
  end
end
