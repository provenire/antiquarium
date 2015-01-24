# == Schema Information
#
# Table name: affiliations
#
#  id          :integer          not null, primary key
#  uuid        :uuid
#  slug        :string           not null
#  name        :string           not null
#  description :text             default("")
#  person_id   :integer
#  place_id    :integer
#  title       :string
#  start_date  :date
#  end_date    :date
#  current     :boolean          default("false")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AffiliationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
