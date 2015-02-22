class SourceSerializer < ActiveModel::Serializer
  embed :ids, embed_in_root: true

  attributes :id, :uuid, :slug, :name, :description, :excerpt, :created_at, :updated_at, :thumbnail,
             :kind, :authors, :date_created, :attribution, :identifier


  def excerpt
    "#{object.description.split('. ').first}."
  end

  def thumbnail
    object.image.index.url || 'no_photo/100.png'
  end
end
