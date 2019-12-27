class CreateObservations < ActiveRecord::Migration[5.2]
  def change
    create_table :observations, id: :uuid do |t|
      t.uuid :observer_id, null: false
      t.uuid :patient_id, null: false
      t.timestamps
    end
    add_foreign_key :observations, :users, column: :observer_id
    add_foreign_key :observations, :patients, columns: :patient_id
    add_index :observations, [:observer_id, :patient_id], unique: true
    add_index :observations, :observer_id
    add_index :observations, :patient_id
  end
end
