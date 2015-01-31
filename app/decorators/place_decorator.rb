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

  def thumbnail
    model.photos.first && model.photos.first.image.index.url || 'no_photo/100.png'
  end

  def show_image
    model.photos.first && model.photos.first.image.show.url || 'no_photo/500.png'
  end

end
