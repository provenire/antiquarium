class AddDefaultValueToArtifactDescription < ActiveRecord::Migration
  def change
    change_column :artifacts, :description, :text, default: ''
  end
end
