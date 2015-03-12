class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :slug, :permalink, :name, :description, :excerpt, :created_at, :updated_at, :links


  def permalink
    "https://data.antiquarium.io/#{object.uuid}"
  end

  def excerpt
    "#{object.description.split('. ').first}."
  end


  # Associations
  def edges
    [:affiliations, :events, :photos, :picture, :sources, :citations]
  end

  def links
    base = "/places/#{object.id}"
    edges.map{|l| [l, "#{base}/#{l}"] }.to_h
  end

end
