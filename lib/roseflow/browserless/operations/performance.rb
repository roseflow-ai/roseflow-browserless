# frozen_string_literal: true

require "literal"

module Roseflow
  module Browserless
    module Operations
      class Performance < Literal::Struct
        CATEGORIES = ["accessibility", "performance", "seo", "pwa", "best practices"].freeze

        attribute :url, String
        attribute :categories, Array, default: CATEGORIES

        def path
          "/performance"
        end

        def timeout
          300
        end

        def body
          {
            url: url,
            config: {
              extends: "lighthouse:default",
              onlyCategories: categories
            },
          }
        end
      end
    end
  end
end
