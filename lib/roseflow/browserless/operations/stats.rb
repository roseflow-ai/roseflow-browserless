# frozen_string_literal: true

require "literal"

module Roseflow
  module Browserless
    module Operations
      class Stats < Literal::Struct
        attribute :url, String

        def path
          "/stats"
        end

        def body
          {
            url: url,
            config: {
              extends: "lighthouse:default",
              settings: {
                onlyCategories: %w[performance seo],
              },
            },
          }
        end
      end
    end
  end
end
