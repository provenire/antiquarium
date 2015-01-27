class AddVerbReferenceToEvents < ActiveRecord::Migration
  def change
    remove_index  :events, :verb
    remove_column :events, :verb

    add_reference :events, :verb, index: true
  end
end
