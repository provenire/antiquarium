# == Schema Information
#
# Table name: artifacts
#
#  id              :integer          not null, primary key
#  uuid            :uuid
#  slug            :string           not null
#  name            :string           not null
#  description     :text
#  alternate_names :string           default("{}"), not null, is an Array
#  artist          :string
#  dimensions      :string
#  date_created    :string
#  group           :boolean          default("false")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Artifact < ActiveRecord::Base

  # Friendly ID
  extend FriendlyId
  friendly_id :name


  # Associations
  has_and_belongs_to_many :events, -> { order('date DESC NULLS LAST') }
  has_many :annotations, as: :tagged

  has_many :annotated_pages,                     through: :annotations,     source: :page
  has_many :annotated_sources,                   through: :annotated_pages, source: :source
  has_many :photos, -> { where(kind: 'photo') }, through: :annotated_pages, source: :source

  # hack central
  has_many :source_events, -> { uniq }, through: :interactions,  source: :event
  has_many :citations,     -> { uniq }, through: :source_events
  has_many :sources,       -> { uniq }, through: :citations


  # Validations
  validates :name, presence: true

end
