# == Schema Information
#
# Table name: interactions
#
#  id            :integer          not null, primary key
#  actor_id      :integer
#  actor_type    :string
#  event_id      :integer
#  recipient     :boolean          default("true"), not null
#  unknown_actor :boolean          default("false"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Interaction < ActiveRecord::Base

  # Associations
  belongs_to :actor, polymorphic: true
  belongs_to :event


  # Validations
  validates :recipient,     presence: true
  validates :unknown_actor, presence: true

end
