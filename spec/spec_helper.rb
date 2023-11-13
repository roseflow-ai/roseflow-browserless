# frozen_string_literal: true

require "roseflow/browserless"
require "anyway_config"
require "vcr"
require "webmock"

Anyway::Settings.use_local_files = true

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr"
  config.hook_into :webmock
  config.filter_sensitive_data("<API_TOKEN>") { Roseflow::Browserless::Config.new.api_token }
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
