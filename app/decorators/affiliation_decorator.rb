class AffiliationDecorator < ObjectDecorator
  delegate_all

  def start_date
    model.start_date ? model.start_date.to_s(:long_ordinal) : 'Unknown'
  end

  def end_date
    model.current ? 'Present' : model.end_date.to_s(:long_ordinal)
  end

  def year
    "#{model.start_date && model.start_date.year} - #{model.end_date && model.end_date.year}"
  end

end
