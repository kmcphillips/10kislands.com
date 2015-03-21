class PublishJob < ActiveJob::Base
  queue_as :default

  def perform(opts={})

  end
end
