class Api::MessagesController < Api::ApplicationController

  skip_before_filter :verify_authenticity_token

  def handle
    @message = Message.create(
      from: Phone.where(number: params["From"]).first_or_create,
      to: Phone.where(number: params["To"]).first_or_create,
      body: params["Body"],
      remote_id: params["MessageSid"],
      status: :sent
    )
  end

end
