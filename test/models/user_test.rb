# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string           not null
#  crypted_password                :string
#  salt                            :string
#  created_at                      :datetime
#  updated_at                      :datetime
#  remember_me_token               :string
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  activation_state                :string
#  activation_token                :string
#  activation_token_expires_at     :datetime
#  failed_logins_count             :integer          default("0")
#  lock_expires_at                 :datetime
#  unlock_token                    :string
#  last_login_at                   :datetime
#  last_logout_at                  :datetime
#  last_activity_at                :datetime
#  last_login_from_ip_address      :string
#  name                            :string           default(""), not null
#  slug                            :string           not null
#  description                     :string           default("")
#  uuid                            :uuid
#  company                         :string
#  location                        :string
#  role                            :string           default("user"), not null
#  login_count                     :integer          default("0"), not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
