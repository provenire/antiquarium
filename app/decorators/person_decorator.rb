class PersonDecorator < ObjectDecorator
  delegate_all

  def nationality
    model.nationality.capitalize || h.content_tag(:em, 'Unknown')
  end

  def gender
    model.gender == 'unknown' ? h.content_tag(:em, 'Unknown') : model.gender.capitalize
  end

  def date_of_birth
    model.date_of_birth ? model.date_of_birth.to_s(:long_ordinal) : h.content_tag(:em, 'Unknown')
  end

  def date_of_death
    model.date_of_birth ? model.date_of_birth.to_s(:long_ordinal) : h.content_tag(:em, 'Unknown')
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

  def show_half_image
    model.photos.first && model.photos.first.image.show_half.url || 'no_photo/500.png'
  end

end
