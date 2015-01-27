# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  uuid           :uuid
#  slug           :string           not null
#  name           :string           not null
#  description    :text             default("")
#  date           :date
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  price_cents    :integer          default("0"), not null
#  price_currency :string           default("USD"), not null
#  failed         :boolean          default("false"), not null
#  verb_id        :integer
#

class Event < ActiveRecord::Base

  # Friendly ID
  extend FriendlyId
  friendly_id :format_name


  # Money
  monetize :price_cents, with_model_currency: :price_currency


  # Associations
  has_and_belongs_to_many :artifacts
  has_many :interactions
  has_many :citations
  has_many :actors, through: :interactions
  belongs_to :verb


  # Validations
  validates :verb_id, presence: true


  # Callbacks
  before_save do |model|
    model.name = format_name
  end


  private

  # Helpers
  def format_date
    date ? date.year : 'Unknown Date'
  end

  def format_name
    (['', format_date] - ['', 'Unknown']).join(', ')
  end

end
