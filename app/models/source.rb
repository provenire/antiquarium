# == Schema Information
#
# Table name: sources
#
#  id           :integer          not null, primary key
#  uuid         :uuid
#  slug         :string           not null
#  kind         :string           default("document"), not null
#  name         :string           not null
#  description  :text             default("")
#  authors      :string           default("")
#  date_created :date
#  attribution  :string           default("")
#  thumbnail    :string
#  document     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Source < ActiveRecord::Base

  # Friendly ID
  extend FriendlyId
  friendly_id :name


  # Uploaders
  mount_uploader :document, DocumentUploader


  # Associations
  has_many :pages


  # Validations
  validates :name, presence: true

end
