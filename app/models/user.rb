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
#

class User < ActiveRecord::Base

  # Friendly ID
  extend FriendlyId
  friendly_id :name


  # Sorcery Authentication
  authenticates_with_sorcery!


  # Messages
  acts_as_messageable


  # Validations
  validates :email, uniqueness: true
  validates :name,  presence: true

  with_options if: :new_password? do |user|
    user.validates :password, length: { minimum: 8 }
    user.validates :password, confirmation: true
    user.validates :password_confirmation, presence: true
  end


  # Callbacks
  before_create :setup_activation


  # Helpers
  def external?
    false
  end

  def publish(event, content)
    Pusher.trigger(channel_name, event, content)
  end


  private

  def channel_name
    "private-user.#{id}"
  end

  def new_password?
    password.present?
  end

end
