# frozen_string_literal: true

require "faraday"
require "async/http/faraday"

require "roseflow/browserless/config"
require "roseflow/browserless/operations"

module Roseflow
  module Browserless
    class Client
      def initialize(config = Config.new)
        @config = config
      end

      def screenshot(url, options)
        operation = Operations::Screenshot.new(url: url, options: options)
        post(operation)
      end

      def stats(url)
        operation = Operations::Stats.new(url: url)
        post(operation)
      end

      def post(operation, &block)
        response = connection.post(operation.path) do |request|
          request.body = operation.body
        end

        response unless block_given?
      end

      private

      attr_reader :config

      def connection
        @connection ||= Faraday.new(
          url: config.api_url,
          headers: {
            "Cache-Control" => "no-cache",
          },
        ) do |app|
          app.params["token"] = config.api_token
          app.request :json
          app.response :json, content_type: /\bjson$/
          app.adapter :async_http
        end
      end
    end
  end
end
