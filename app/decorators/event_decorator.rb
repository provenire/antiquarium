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

  def first_artifact
    model.artifacts.first.decorate
  end

  def first_subject
    model.subjects.first.decorate unless model.subjects.empty?
  end

  def first_recipient
    model.recipients.first.decorate unless model.recipients.empty?
  end

  def subjects_image
    first_subject.try(:show_image) || 'no_photo/500.png'
  end

  def recipients_image
    first_recipient.try(:show_image) || 'no_photo/500.png'
  end

  def price
    model.price.zero? ? h.content_tag(:em, 'N/A') : h.humanized_money_with_symbol(model.price)
  end

  def status
    model.status || h.content_tag(:em, 'N/A')
  end

  def citations_list
    citeproc = CiteProc::Processor.new(style: 'chicago-fullnote-bibliography', format: 'text')
    model.citations.map(&:cite).each{|cite| citeproc << cite }
    citeproc.bibliography.to_a
  end

end
