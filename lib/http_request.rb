require 'typhoeus'
require 'json'
require 'byebug'
class HttpRequest # rubocop:disable Style/Documentation
  def initialize(webhook_url)
    @webhook_url = webhook_url
  end

  def create(body, verbose: false)
    request(body:, verbose:)
  end

  protected

  def request(body: {}, verbose: false) # rubocop:disable Metrics/MethodLength
    body = body.to_h
    body = body.delete_if { |_k, v| v.nil? || v.to_s.empty? }
    body = body.to_json

    response = Typhoeus::Request.new(
      @webhook_url,
      method: :post,
      body:,
      headers: { 'Content-Type': 'application/json' },
      verbose:
    ).run

    if response.success?
      JSON.parse(response.body) unless response.body.empty?
    else
      error_api = JSON.parse(response.body)
      { error: error_api }
    end
  end
end
