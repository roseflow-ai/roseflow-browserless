# frozen_string_literal: true

module Roseflow
  module Browserless
    RSpec.describe Client do
      describe "#screenshot" do
        let(:url) { "https://www.tikscale.net" }
        let(:options) { { fullPage: true, type: "jpeg", quality: 75 } }
        let(:client) { Roseflow::Browserless::Client.new }

        it "returns a screenshot" do
          VCR.use_cassette("screenshot", record: :new_episodes) do
            operation = client.screenshot(url, options)
            expect(operation).to be_success
            File.write("screenshot.jpg", operation.body)
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
    end
  end
end
