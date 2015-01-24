# == Schema Information
#
# Table name: affiliations
#
#  id          :integer          not null, primary key
#  uuid        :uuid
#  slug        :string           not null
#  name        :string           not null
#  description :text             default("")
#  person_id   :integer
#  place_id    :integer
#  title       :string
#  start_date  :date
#  end_date    :date
#  current     :boolean          default("false")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Affiliation < ActiveRecord::Base

  # Friendly ID
  extend FriendlyId
  friendly_id :format_name


  # Associations
  belongs_to :person
  belongs_to :place


  # Validations
  # ?


  # Callbacks
  before_save do |affiliation|
    affiliation.name = format_name
  end


  private

  # Helpers
  def format_start_date
    start_date ? start_date.year : 'Unknown'
  end

  def format_end_date
    current ? 'Present' : (end_date ? end_date.year : nil)
  end

  def format_date
    [format_start_date, format_end_date].compact.join(' - ')
  end

  def format_name
    (["#{person.name} with #{place.name}", format_date] - ['', 'Unknown']).join(', ')
  end

end
