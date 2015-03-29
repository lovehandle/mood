class Api::MessagesController < Api::ApplicationController

  def handle
    @message = Message.create(from: params["From"], to: params["To"], body: params["Body"], status: :sent)
  end

end
