class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.uuid   :uuid,          default: 'uuid_generate_v4()', null: false
      t.string :slug,                                         null: false

      t.string :name,                                         null: false
      t.text   :description,   default: ''

      t.string :gender,        default: 'unknown',            null: false
      t.date   :date_of_birth
      t.date   :date_of_death
      t.string :nationality,   default: 'unknown',            null: false

      t.timestamps                                            null: false
    end

    add_index :people, :uuid, unique: true
    add_index :people, :slug, unique: true
  end
end
