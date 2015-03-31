class Message::Handler
  MAPPING = {
    "To" => "to",
    "ToCountry" => "to_country",
    "ToState" => "to_state",
    "ToCity" => "to_city",
    "ToZip" => "to_zip",
    "From" => "from",
    "FromCountry" => "from_country",
    "FromState" => "from_state",
    "FromCity" => "from_city",
    "FromZip" => "from_zip",
    "Body" => "body",
    "SmsSid" => "sms_sid",
    "SmsMessageSid" => "sms_message_sid",
    "SmsStatus" => "sms_status",
    "NumMedia" => "num_media",
    "AccountSid" => "account_sid",
    "ApiVersion" => "api_version"
  }

  MAPPING.values.each do |method_name|
    attr_accessor method_name
  end

  def self.perform(*args)
    new(*args).perform
  end

  def initialize(params)
    MAPPING.each do |key, value|
      send("#{value}=", params[key])
    end
  end

  def perform
    Message.create(from: Phone.find_by(from: obj.from), to: Phone.find_by(to: obj.to), body: obj.body, remote_id: sms_message_id, state: :sent)
  end
end
