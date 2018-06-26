class CreateSideEffectIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :side_effect_incidents do |t|

      t.references :side_effect, foreign_key: true
      t.references :incident, foreign_key: true


      t.timestamps
    end
  end
end
