require "literal"

module Roseflow::Browserless::Operations
  class Content < Literal::Struct
    attribute :url, String

    def path
      "/content"
    end

    def timeout
      60
    end

    def body
      {
        url: url
      }
    end
  end
end