class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true, on: :update
  validates :password_confirmation, presence: true, on: :update

  validates :email, uniqueness: true

  before_create :setup_activation
  
  def external?
    false
  end

end
