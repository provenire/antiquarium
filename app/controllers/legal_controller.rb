class LegalController < ApplicationController
  skip_before_filter :require_login
  layout             'legal'

  def privacy_policy
  end

end
