namespace :messages do
  desc "Sends all scheduled messages"
  task enqueue_delivery: :environment do
    Schedule.find_each do |schedule|
      # Remove this until I want to pay for DJ support
      # DeliverMessageJob.set(wait_until: schedule.wait_until).perform_later(schedule)
      if (Time.now - schedule.wait_until.to_time).abs.seconds <= 10.minutes
        DeliverMessageJob.perform_now(schedule)
      end
    end
  end
end
