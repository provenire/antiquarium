class AnnotationSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :name, :description, :location, :links


  # Assocations
  def edges
    [:page, :source, :tagged]
  end

  def links
    base = "/annotations/#{object.id}"
    edges.map{|l| [l, "#{base}/#{l}"] }.to_h
  end

end
