class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients, id: :uuid do |t|
      t.uuid :registrant_id, null: false
      t.string :given_name, null: false
      t.string :last_name, null: false
      t.date :birthdate, null: false
      t.string :gender, null: false
      t.string :relationship, null: false

      t.timestamps
    end
    add_foreign_key :patients, :users, column: :registrant_id
    add_index :patients, :registrant_id
  end
end
