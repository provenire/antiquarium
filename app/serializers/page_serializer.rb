class PageSerializer < ActiveModel::Serializer
  attributes :number, :text, :created_at, :updated_at, :image, :links, :total_annotations

  def image
    object.image.versions.map{|k,v| [k, v.url] }.to_h
  end

  def total_annotations
    object.annotations.size
  end

  def links
    {
      source:      "/sources/#{object.source_id}",
      annotations: "/sources/#{object.source_id}/pages/#{object.number}/annotations"
    }
  end

end
