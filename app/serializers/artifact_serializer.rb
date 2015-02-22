class ArtifactSerializer < ActiveModel::Serializer
  embed :ids, embed_in_root: true

  attributes :id, :uuid, :slug, :name, :description, :excerpt, :artist, :dimensions, :date_created, :created_at, :updated_at, :thumbnail

  def excerpt
    "#{object.description.split('. ').first}."
  end

  def thumbnail
    object.photos.first && object.photos.first.image.index.url || '/assets/antiquarium/no_photo/100.png'
  end
end
