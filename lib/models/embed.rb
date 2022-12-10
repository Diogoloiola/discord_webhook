require_relative 'base_model'
require 'time'

module Models
  class Embed < BaseModel
    TypeEmbed = Types::Strict::String.enum('rich', 'image', 'video', 'gifv', 'article', 'link')

    attribute :title, Types::Strict::String.optional.default(nil)
    attribute :type, TypeEmbed.optional.default('rich'.freeze)
    attribute :description, Types::Strict::String.optional.default(nil)
    attribute :url, Types::Strict::String.optional.default(nil)
    attribute :timestamp, Types::Strict::String.optional.default(DateTime.now.to_time.iso8601.freeze)
    attribute :color, Types::Strict::Integer.optional.default(10_038_562)
  end
end
