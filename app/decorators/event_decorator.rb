class EventDecorator < ObjectDecorator
  delegate_all

  def year
    model.date ? model.date.year : '----'
  end

  def subject_name
    model.subjects.empty? ? 'Unknown' : model.subjects.map(&:name).to_sentence
  end

  def recipient_name
    model.recipients.empty? ? 'Unknown' : model.recipients.map(&:name).to_sentence
  end

  def artifacts_name
    model.artifacts.empty? ? 'unknown artifact(s)' : model.artifacts.pluck(:name).to_sentence
  end

  def description
    model.description.empty? ? h.content_tag(:em, 'No description') : model.description
  end

  def history_name
    "#{model.verb.noun.capitalize} of #{artifacts_name}"
  end

end
