class PlaceDecorator < ObjectDecorator
  delegate_all

  def address
    h.content_tag(:em, 'Unknown')
  end

  def lattitude
    h.content_tag(:em, 'Unknown')
  end

  def longitude
    h.content_tag(:em, 'Unknown')
  end

  def events
    model.events.decorate
  end

  def affiliations
    model.affiliations.decorate
  end

end
