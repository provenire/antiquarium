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

require 'test_helper'

class AnnotationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
