module Ucenter
  module Interface
    class App < Base
      def get_apps(col = '*', where = '')
        col = db_client.escape(col)
        where = db_client.escape(where)
        data = db_client.query("SELECT #{col} FROM #{Ucenter::Config.uc_dbtablepre}applications #{where!="" ? " WHERE #{where} " : ""}").to_a
        data.each_with_index do |item,index|
          item['extra'] = Ucenter::Tools::PHP.unserialize(item['extra'])
          data[index] = item
        end
      end
    end
  end
end

