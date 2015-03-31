class Api::MessagesController < Api::ApplicationController
  skip_before_filter :verify_authenticity_token

  def handle
    Message::Handler.perform(params)
  end
end
