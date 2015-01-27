class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.uuid   :uuid,        default: 'uuid_generate_v4()', null: false
      t.string :slug,                                       null: false

      t.string :name,                                       null: false
      t.text   :description, default: ''

      t.date   :date
      t.string :verb,        default: 'unknown',            null: false
      #t.monetize :price,    default: nil,                   null: true
      t.string :status

      t.timestamps null: false
    end

    add_money :events, :price

    add_index :events, :uuid, unique: true
    add_index :events, :slug, unique: true
    add_index :events, :verb
    add_index :events, :status
  end
end
