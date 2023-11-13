# frozen_string_literal: true

RSpec.describe Roseflow::Browserless do
  it "has a version number" do
    expect(Roseflow::Browserless.gem_version).not_to be nil
  end
end
