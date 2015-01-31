class ChangeSourceThumbnailToImage < ActiveRecord::Migration
  def change
    rename_column :sources, :thumbnail, :image
  end
end
