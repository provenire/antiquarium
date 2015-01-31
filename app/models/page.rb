# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  source_id  :integer
#  number     :integer
#  text       :text
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ActiveRecord::Base

  # Uploaders
  mount_uploader :image, ImageUploader


  # Associations
  belongs_to :source
  has_many   :annotations, dependent: :destroy


  # Validations
  validates :number, presence: true

end
