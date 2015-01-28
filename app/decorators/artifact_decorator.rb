class ArtifactDecorator < ObjectDecorator
  delegate_all

  def alternate_names
    model.alternate_names.empty? ? h.content_tag(:em, 'Unknown') : ([model.name] + model.alternate_names).join(', <br/>').html_safe
  end

  def artist
    model.artist.empty? ? h.content_tag(:em, 'Unknown') : model.artist
  end

  def date_created
    model.date_created.empty? ? h.content_tag(:em, 'Unknown') : model.date_created
  end

  def events
    model.events.decorate
  end

  def dimensions
    model.dimensions.empty? ? h.content_tag(:em, 'Unknown') : model.dimensions
  end

end
