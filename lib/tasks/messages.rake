namespace :messages do
  desc "Sends all scheduled messages"
  task enqueue_delivery: :environment do
    Schedule.find_each do |schedule|
      DeliverMessageJob.set(wait_until: schedule.wait_until).perform_later(schedule)
    end
  end
end
