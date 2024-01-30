# frozen_string_literal: true

module Roseflow
  module Browserless
    RSpec.describe Client do
      describe '#screenshot' do
        let(:url) { 'https://www.growsrc.com' }
        let(:options) { { fullPage: true, type: "jpeg", quality: 75 } }
        let(:client) { Roseflow::Browserless::Client.new }

        it "returns a screenshot" do
          VCR.use_cassette("screenshot", record: :new_episodes) do
            # Returns a Hash containing information about the screenshot operation.
            operation = client.screenshot(url, options)
            expect(operation).to be_success
            File.write("screenshot.jpg", operation.body)
          end
        end
      end

      describe "#content" do
        let(:url) { "https://www.growsrc.com" }
        let(:client) { Roseflow::Browserless::Client.new }

        it "returns the HTML content of a page" do
          VCR.use_cassette("content", record: :new_episodes) do
            operation = client.content(url)
            expect(operation).to be_success
            expect(operation.body).to match(/<html.*>.*<\/html>/m)
          end
        end
      end

      describe "#stats" do
        let(:url) { "https://www.growsrc.com" }
        let(:client) { Roseflow::Browserless::Client.new }

        it "returns the stats" do
          VCR.use_cassette("stats", record: :new_episodes) do
            operation = client.stats(url)
            expect(operation).to be_success
          end
        end
      end

      describe "#performance" do
        let(:url) { "https://www.growsrc.com" }
        let(:client) { Roseflow::Browserless::Client.new }

        it "returns the performance metrics" do
          VCR.use_cassette("performance", record: :new_episodes) do
            operation = client.performance(url)
            expect(operation).to be_success
          end
        end
      end
    end
  end
end
