# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  uuid           :uuid
#  slug           :string           not null
#  name           :string           not null
#  description    :text             default("")
#  date           :date
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  price_cents    :integer          default("0"), not null
#  price_currency :string           default("USD"), not null
#  failed         :boolean          default("false"), not null
#  verb_id        :integer
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
