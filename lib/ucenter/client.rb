module Ucenter
  class Client
    def app
      @app ||= Ucenter::Interface::App.new(self)
    end

    def authcode
      @authcode ||= Ucenter::Interface::Authcode.new(self)
    end

    def user
      @user ||= Ucenter::Interface::User.new(self)
    end
  end
end
