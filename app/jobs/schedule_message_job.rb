class ScheduleMessageJob < ActiveJob::Base
  queue_as :default

  def perform(schedule)
    return unless schedule.to.confirmed?
    Message.create(
      from: schedule.from,
      to: schedule.to,
      body: schedule.body,
      state: :enqueued
    ).tap do |message|
      DeliverMessageJob.set(wait_until: schedule.time).perform_later(message)
    end
  end
end
