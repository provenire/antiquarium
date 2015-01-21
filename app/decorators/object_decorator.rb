class ObjectDecorator < Draper::Decorator

  def excerpt
    "#{model.description.split('. ').first}."
  end

  def last_updated
    model.updated_at.to_date.to_formatted_s(:long_ordinal)
  end

end
