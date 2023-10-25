class WebhookController < ApplicationController
  def show
    @webhook = Webhook.find(params[:id])
  end

  # Post to this webhook
  skip_before_action :verify_authenticity_token, only: [:post]
  def post
    webhook = Webhook.find(params[:id])
    headers = request.headers.env.each.to_a.keep_if{|a,b| a.start_with?("HTTP_") && !b.empty?}.map{|a,b| "#{a[5..]}: #{b}"}.join "\n"
    if webhookrequest = WebhookRequest.new(headers: headers, body: request.raw_post, webhook: webhook).save
      head 200
    else
      head 500
    end
  end
end
