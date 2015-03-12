class EventSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :slug, :name, :description, :created_at, :updated_at,
             :date, :status, :price_cents, :price_currency, :failed,
             :subject_name, :recipient_name, :artifacts_name

  def subject_name
    object.subjects.empty? ? 'Unknown' : object.subjects.map(&:name).to_sentence
  end

  def recipient_name
    object.recipients.empty? ? 'Unknown' : object.recipients.map(&:name).to_sentence
  end

  def artifacts_name
    object.artifacts.empty? ? 'unknown artifact(s)' : object.artifacts.pluck(:name).to_sentence
  end

end
