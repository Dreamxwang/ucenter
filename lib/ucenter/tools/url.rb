module Ucenter
  module Tools
    class Url < Base
      def explain_query(query_params)
        query_params = '' if query_params === {}
        # systemname=cets&responsible=sj ==> {"systemname"=>"cets","responsible"=>"sj"}
        # only very sample explain,
        # have not care about special char ,e.g. & = ...
        re = {}
        if query_params.nil? or query_params == ""
          return re # empty ,need not explain
        end
        querys = query_params.split("&")
        querys.each do | query |
          query_arr = query.split("=")
          re[query_arr[0]]=query_arr[1]
        end
        return re
      end
    end
  end
end

