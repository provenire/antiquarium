class SourceSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :slug, :name, :description, :excerpt, :created_at, :updated_at, :links,
             :kind, :authors, :date_created, :attribution, :identifier, :total_pages,
             :image


  def excerpt
    "#{object.description.split('. ').first}."
  end

  def image
    object.image.versions.map{|k,v| [k, v.url] }.to_h
  end

  def total_pages
    object.pages.size
  end

  def links
    {
      pages: "/sources/#{object.id}/pages"
    }
  end

end
