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

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
