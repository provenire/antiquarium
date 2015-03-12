class AffiliationSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :slug, :permalink, :name, :description, :created_at, :updated_at, :links,
             :title, :start_date, :end_date, :current


  def permalink
    "https://data.antiquarium.io/#{object.uuid}"
  end

  def excerpt
    "#{object.description.split('. ').first}."
  end


  # Associations
  def edges
    [:person, :place]
  end

  def links
    base = "/affiliations/#{object.id}"
    edges.map{|l| [l, "#{base}/#{l}"] }.to_h
  end

end
