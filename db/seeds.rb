from = Phone.create(number: "+14253187104")
to = Phone.create(number: "+14152169952")
question = Question.create(body: "How are you today?")
schedule = Schedule.create(from: from, to: to, question: question, time_offset: 8 * 60 * 60, zone_offset: Time.zone_offset('EST'))
