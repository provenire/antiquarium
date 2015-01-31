class ObjectDecorator < Draper::Decorator

  def excerpt
    "#{model.description.split('. ').first}."
  end

  def last_updated
    model.updated_at.to_date.to_formatted_s(:long_ordinal)
  end

  def thumbnail
    'no_photo/100.png'
  end

  def show_image
    'no_photo/500.png'
  end

end
