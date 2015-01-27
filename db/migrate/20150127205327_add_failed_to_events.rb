class AddFailedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :failed, :boolean, default: false, null: false
  end
end
