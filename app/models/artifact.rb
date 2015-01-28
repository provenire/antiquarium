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


  # Validations
  validates :name, presence: true

end
