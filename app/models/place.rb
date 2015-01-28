# == Schema Information
#
# Table name: places
#
#  id          :integer          not null, primary key
#  uuid        :uuid
#  slug        :string           not null
#  name        :string           not null
#  description :text             default("")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Place < ActiveRecord::Base

  # Friendly ID
  extend FriendlyId
  friendly_id :name


  # Associations
  has_many :affiliations
  has_many :interactions, as: :actor
  has_many :events, through: :interactions


  # Validations
  validates :name, presence: true

end
