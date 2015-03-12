class EventSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :slug, :permalink, :name, :description, :created_at, :updated_at, :links,
             :verb, :date, :status, :price_cents, :price_currency, :failed


  def permalink
    "https://data.antiquarium.io/#{object.uuid}"
  end

  def verb
    {
      keyword: object.verb.keyword,
      action:  object.verb.action,
      noun:    object.verb.noun
    }
  end


  # Assocations
  def edges
    [:artifacts, :interactions, :sources, :citations]
  end

  def links
    base = "/events/#{object.id}"
    edges.map{|l| [l, "#{base}/#{l}"] }.to_h
  end

end
