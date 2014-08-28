module Ucenter
  class Utility
    def url
      @url ||= Ucenter::Tools::Url.new(self)
    end

    def xml
      @xml ||= Ucenter::Tools::Xml.new(self)
    end

  end
end
