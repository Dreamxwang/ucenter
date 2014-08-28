module Ucenter
  module Interface
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

      def db_client
        config = Hash.new
        config[:host]     = Ucenter::Config.uc_dbhost unless Ucenter::Config.uc_dbhost.nil?
        config[:username] = Ucenter::Config.uc_dbuser unless Ucenter::Config.uc_dbuser.nil?
        config[:password] = Ucenter::Config.uc_dbpw unless Ucenter::Config.uc_dbpw.nil?
        config[:database] = Ucenter::Config.uc_dbname unless Ucenter::Config.uc_dbname.nil?
        config[:encoding] = Ucenter::Config.uc_dbcharset unless Ucenter::Config.uc_dbcharset.nil?
        Mysql2::Client.new(config)
      end

    end
  end
end
