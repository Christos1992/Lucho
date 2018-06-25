class CreateParents < ActiveRecord::Migration[5.2]
  def change
    create_table :parents do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :date_of_birth
      t.string :working_status
      t.string :civil_status
      t.text :hobbies
      t.boolean :share_info
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
