class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :date_of_birth
      t.string :type_of_cancer
      t.integer :stage_of_cancer
      t.boolean :first_time_patient
      t.date :date_treatment_begin
      t.string :hospital_name
      t.string :doctor_name
      t.boolean :school
      t.text :biggest_dream
      t.text :medications
      t.references :parent, foreign_key: true

      t.timestamps
    end
  end
end
