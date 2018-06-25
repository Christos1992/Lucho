class CreateChildMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :child_medications do |t|
      t.string :perscriptioned_doses
      t.boolean :active
      t.integer :days_for_useage


      t.references :medication, foreign_key: true
      t.references :child, foreign_key: true


      t.timestamps
    end
  end
end
