module Ucenter
  module Tools
    # The Base class of API
    class Base
      def initialize(client)
        @client = client
      end

      def get(path, opts={}, &block)
        request(:get, path, opts, &block)
      end

      def post(path, opts={}, &block)
        request(:post, path, opts, &block)
      end
    end
  end
end
