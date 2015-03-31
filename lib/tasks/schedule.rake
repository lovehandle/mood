namespace :schedule do
  desc "Schedules messages for the day"
  task messages: :environment do
    Schedule.find_each do |schedule|
      ScheduleMessageJob.perform_later(schedule)
    end
  end
end
