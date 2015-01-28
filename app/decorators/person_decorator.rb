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

end
