class ArtifactSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :slug, :permalink, :name, :description, :excerpt, :created_at, :updated_at, :links,
             :alternate_names, :artist, :dimensions, :date_created


  def permalink
    "https://data.antiquarium.io/#{object.uuid}"
  end

  def excerpt
    "#{object.description.split('. ').first}."
  end


  # Associations
  def edges
    [:picture, :events, :photos, :sources, :citations]
  end

  def links
    base = "/artifacts/#{object.id}"
    edges.map{|l| [l, "#{base}/#{l}"] }.to_h
  end

end
