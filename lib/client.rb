require_relative './api/message'

class Client
  def initialize(webhook_url)
    @webhook_url = webhook_url
  end

  def messages
    @messages ||= Api::Message.new(@webhook_url)
  end
end
