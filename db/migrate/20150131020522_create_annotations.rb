class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.uuid       :uuid,        default: 'uuid_generate_v4()', null: false

      t.references :page,                      index: true
      t.references :tagged, polymorphic: true, index: true

      t.string     :name,        default: '',                   null: false
      t.text       :description, default: ''

      t.json       :location

      t.timestamps null: false
    end
  end
end
