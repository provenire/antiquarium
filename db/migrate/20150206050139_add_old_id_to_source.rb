class AddOldIdToSource < ActiveRecord::Migration
  def change
    add_column :sources, :old_id, :integer
    add_index  :sources, :old_id
  end
end
