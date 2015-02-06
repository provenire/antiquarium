class ProcessWebsiteJob < ActiveJob::Base
  queue_as :default

  def perform(source)
    
  end
end
