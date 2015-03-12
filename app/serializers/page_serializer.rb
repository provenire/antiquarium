class PageSerializer < ActiveModel::Serializer
  attributes :id, :number, :text, :created_at, :updated_at, :image, :links, :total_annotations

  def image
    object.image.versions.map{|k,v| [k, v.url] }.to_h
  end

  def total_annotations
    object.annotations.size
  end


  # Assocations
  def edges
    [:source, :annotations]
  end

  def links
    base = "/pages/#{object.id}"
    edges.map{|l| [l, "#{base}/#{l}"] }.to_h
  end

end
