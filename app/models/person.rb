# == Schema Information
#
# Table name: people
#
#  id            :integer          not null, primary key
#  uuid          :uuid
#  slug          :string           not null
#  name          :string           not null
#  description   :text             default("")
#  gender        :string           default("unknown"), not null
#  date_of_birth :date
#  date_of_death :date
#  nationality   :string           default("unknown"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Person < ActiveRecord::Base

  # Friendly ID
  extend FriendlyId
  friendly_id :name


  # Associations
  has_many :affiliations
  has_many :interactions, as: :actor
  has_many :events, -> { uniq.order('date DESC NULLS LAST') }, through: :interactions


  # Validations
  validates :name,        presence: true
  validates :gender,      presence: true
  validates :nationality, presence: true

end
