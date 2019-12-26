class CreateMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications, id: :uuid do |t|
      t.uuid :patient_id, null: false
      t.string :name, null: false
      t.string :frequency, null: false, default: ''
      t.string :duration, null: false, default: ''
      t.string :dosage, null: false, default: ''
      t.time :time, null: false, default: ''
      t.date :date, null: false, default: ''
      t.string :forma, null: false, default: ''

      t.timestamps
    end
    add_index :medications, :patient_id
    add_foreign_key :medications, :patients, column: :patient_id
  end
end
