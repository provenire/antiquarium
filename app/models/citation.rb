# == Schema Information
#
# Table name: citations
#
#  id         :integer          not null, primary key
#  source_id  :integer
#  entry_id   :integer
#  entry_type :string
#  number     :integer
#  content    :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Citation < ActiveRecord::Base

  # Associations
  belongs_to :source
  belongs_to :entry, polymorphic: true


  # Validations
  validates :source, presence: true
  validates :entry,  presence: true

end
