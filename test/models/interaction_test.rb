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

require 'test_helper'

class InteractionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
