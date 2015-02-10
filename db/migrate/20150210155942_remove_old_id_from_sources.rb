class RemoveOldIdFromSources < ActiveRecord::Migration
  def change
    remove_index  :sources, :old_id
    remove_column :sources, :old_id, :integer
  end
end
