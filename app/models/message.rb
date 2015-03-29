class Message < ActiveRecord::Base

  enum status: [ :unsent, :sent, :errored ]

  belongs_to :from, foreign_key: :from_id, class: Phone
  belongs_to :to, foreign_key: :to_id, class: Phone

  validates :from, presence: true
  validates :to, presence: true

  def remote
    client.messages.find(remote_id)
  end

  def deliver
    client.messages.create(to: to.number, from: from.number, body: body).tap do |m|
      update_attributes(remote_id: m.sid, status: :sent)
    end
  rescue Twilio::REST::RequestError => e
    update_attributes(status: :unsent, status_details: e.message)
  end

  private

  def client
    @client ||= Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
  end

end
