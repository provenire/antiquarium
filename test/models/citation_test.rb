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

require 'test_helper'

class CitationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
