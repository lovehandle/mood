class DeliverMessageJob < ActiveJob::Base
  queue_as :default

  def perform(message)
    message.deliver!
  end
end
