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
#  image        :string
#  document     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  identifier   :string
#

class Source < ActiveRecord::Base

  # Friendly ID
  extend FriendlyId
  friendly_id :name


  # Uploaders
  mount_uploader :document, DocumentUploader
  mount_uploader :image,    ImageUploader


  # Associations
  has_many :pages, dependent: :destroy
  has_many :annotations, through: :pages


  # Validations
  validates :name, presence: true
  validates :kind, presence: true


  # Callbacks
  after_create do |source|
    "process_#{kind}_job".camelize.constantize.perform_later(self)
  end

end
