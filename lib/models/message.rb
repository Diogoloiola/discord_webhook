require_relative 'base_model'
require_relative 'embed'

module Models
  class Message < BaseModel
    attribute :content, Types::Strict::String.optional.default(nil)
    attribute :username, Types::Strict::String.optional.default(nil)
    attribute :avatar_url, Types::Strict::String.optional.default(nil)
    attribute :tts, Types::Strict::Bool.optional.default(false)
    attribute :embeds?, Types::Strict::Array.of(Models::Embed).optional
  end
end
