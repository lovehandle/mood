class Api::MessagesController < Api::ApplicationController

  skip_before_filter :verify_authenticity_token

  def handle
    @message = Message.create(
      from: params["From"],
      to: params["To"],
      body: params["Body"],
      remote_id: params["MessageSid"],
      status: :sent
    )
  end

end
