require_relative '../lib/client'
require_relative '../lib/models/message'
require_relative '../lib/models/embed'

message = Models::Message.new(
  username: 'Bot Test',
  content: 'Free code Camp',
  embeds: [
    Models::Embed.new(
      title: 'Free Code Camp',
      description: 'https://www.youtube.com/@freecodecamp'
    )
  ]
)

discord_client = Client.new(webhook_url)

discord_client.messages.create(message)
