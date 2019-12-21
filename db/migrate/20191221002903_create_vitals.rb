class CreateVitals < ActiveRecord::Migration[5.2]
  def change
    create_table :vitals, id: :uuid do |t|
      t.uuid :patient_id, null: false
      t.float :weight, null: false, default: 0
      t.float :systolic, null: false, default: 0
      t.float :diastolic, null: false, default: 0
      t.float :temperature, null: false, default: 0
      t.integer :mental_condition, null: false, default: 0
      t.integer :physical_health, null: false, default: 0
      t.integer :locomotive, null: false, default: 0

      t.timestamps
    end
    add_index :vitals, :patient_id
    add_foreign_key :vitals, :patients, column: :patient_id
  end
end
