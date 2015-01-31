class AddIdentifierToSource < ActiveRecord::Migration
  def change
    add_column :sources, :identifier, :string
    add_index  :sources, :identifier
  end
end
