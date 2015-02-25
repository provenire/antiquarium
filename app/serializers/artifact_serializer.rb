class ArtifactSerializer < ActiveModel::Serializer
  embed :ids, embed_in_root: true

  attributes :id, :uuid, :slug, :name, :description, :excerpt, :created_at, :updated_at,
             :thumbnail, :show_image,
             :alternate_names, :artist, :dimensions, :date_created

  has_many :events

  def excerpt
    "#{object.description.split('. ').first}."
  end

  def thumbnail
    object.photos.first && object.photos.first.image.index.url || 'https://s3-us-west-1.amazonaws.com/data.static.antiquarium.io/assets/antiquarium/no_photo/100.png'
  end

  def show_image
    object.photos.first && object.photos.first.image.show.url || 'https://s3-us-west-1.amazonaws.com/data.static.antiquarium.io/assets/antiquarium/no_photo/500.png'
  end

end
