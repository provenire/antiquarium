# == Schema Information
#
# Table name: annotations
#
#  id          :integer          not null, primary key
#  uuid        :uuid
#  page_id     :integer
#  tagged_id   :integer
#  tagged_type :string
#  name        :string           default(""), not null
#  description :text             default("")
#  location    :json
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Annotation < ActiveRecord::Base

  # Associations
  belongs_to :page
  has_one    :source, through: :page
  belongs_to :tagged, polymorphic: true


  # Validations
  validates :name, presence: true

end
