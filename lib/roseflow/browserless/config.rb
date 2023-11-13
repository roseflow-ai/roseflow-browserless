# frozen_string_literal: true

require "anyway_config"

module Roseflow
  module Browserless
    class Config < Anyway::Config
      config_name :browserless

      attr_config :api_token
      attr_config api_url: "https://chrome.browserless.io"
    end
  end
end
