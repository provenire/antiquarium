# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  uuid                            :uuid
#  slug                            :string           not null
#  email                           :string           not null
#  name                            :string           default(""), not null
#  description                     :string           default("")
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
#

class User < ActiveRecord::Base

  # Friendly ID
  extend FriendlyId
  friendly_id :name


  # Sorcery Authentication
  authenticates_with_sorcery!


  # Validations
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true, on: :update
  validates :password_confirmation, presence: true, on: :update

  validates :email, uniqueness: true

  validates :name, presence: true


  # Callbacks
  before_create :setup_activation


  # Helpers
  def external?
    false
  end

end
