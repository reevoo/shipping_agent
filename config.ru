$LOAD_PATH.unshift File.expand_path("./lib", File.dirname(__FILE__))
require "shipping_agent/github/webhook"
require "logger"

ShippingAgent::Github::Webhook.secret = ENV.fetch("GITHUB_WEBHOOK_SECRET")

use Rack::CommonLogger, Logger.new($stdout)
run ShippingAgent::Github::Webhook
