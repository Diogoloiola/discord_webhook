require 'typhoeus'
require 'json'

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

    request = Typhoeus::Request.new(
      @webhook_url,
      method: :post,
      body:,
      verbose:
    ).run

    if request.success?
      JSON.parse(request.body) unless request.body.empty?
    else
      error_api = JSON.parse(request.body)
      { error: error_api }
    end
  end
end
