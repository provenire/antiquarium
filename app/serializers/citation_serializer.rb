class CitationSerializer < ActiveModel::Serializer
  attributes :id, :number, :content, :links


  # Assocations
  def edges
    [:source]
  end

  def links
    base = "/citations/#{object.id}"
    edges.map{|l| [l, "#{base}/#{l}"] }.to_h
  end

end
