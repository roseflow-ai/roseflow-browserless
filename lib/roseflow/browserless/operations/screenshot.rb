# frozen_string_literal: true

require "literal"

module Roseflow
  module Browserless
    module Operations
      class Screenshot < Literal::Struct
        attribute :url, String
        attribute :options, Hash

        def path
          "/screenshot"
        end

        def body
          {
            url: url,
            options: options,
            scrollPage: true,
          }
        end
      end
    end
  end
end
