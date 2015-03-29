class DeliverMessageJob < ActiveJob::Base
  queue_as :default

  def perform(schedule)
    Message.create(from: schedule.from, to: schedule.to, body: schedule.question.body).deliver
  end

end
