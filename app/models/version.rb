# == Schema Information
#
# Table name: versions
#
#  id             :integer          not null, primary key
#  item_type      :string           not null
#  item_id        :integer          not null
#  event          :string           not null
#  whodunnit      :string
#  object         :text
#  created_at     :datetime
#  object_changes :text
#  ip_address     :string
#  user_agent     :string
#  comment        :string           default("")
#

class Version < PaperTrail::Version
  self.table_name = :versions


  # Discussions
  acts_as_messageable


end
