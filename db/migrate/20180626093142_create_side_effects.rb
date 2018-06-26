class CreateSideEffects < ActiveRecord::Migration[5.2]
  def change
    create_table :side_effects do |t|
      t.string :name
      t.string :none
      t.string :mild
      t.string :moderate
      t.string :severe

      t.timestamps
    end
  end
end
