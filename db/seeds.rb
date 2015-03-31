QUESTION = Question.create(body: "Hi! How are you today?")

TWILIO = Phone.create(number: "+14253187104", confirmed: true)

NUMBERS = %w(
  +14152169952
  +19293330433
  +15033814439
  +15033813050
  +15037532989
  +15037532999
  +15037532993
)

PHONES = NUMBERS.map do |phone|
  Phone.create(number: phone, confirmed: true)
end

PHONES.map do |phone|
  Schedule.create(from: TWILIO, to: phone, question: QUESTION, time_offset: 8 * 60 * 60, zone_offset: Time.zone_offset('EST'))
end
