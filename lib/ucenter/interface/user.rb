module Ucenter
  module Interface
    class User < Base

      def get_user(username, is_uid = FALSE)
        username = db_client.escape(username) unless username.nil?
        if is_uid == 1
          data = get_user_by_uid(username)
        elsif is_uid == 2
          data= get_user_by_email(username)
        elsif is_uid == 3
          data = get_user_by_phone(username)
        else
          data = get_user_by_username(username)
        end
        data
      end

      def check_login(username, password, is_uid = FALSE)
        user = get_user(username, is_uid)
        if user.nil? or user['username'].nil?
          return [-1,nil]
        elsif user['password'] != md5("#{md5(password)}#{user['salt']}")
          return [-2,nil]
        end
        [user['uid'],user]
      end

      def check_username(username)
        len = username.bytesize
        return FALSE if len > 15 or len < 3 or !( /\s+|^c:\\con\\con|\[%,\*\"\s\<\>\&\]|\xA1\xA1|\xAC\xA3|^Guest|^\xD3\xCE\xBF\xCD|\xB9\x43\xAB\xC8/is =~ username).nil?
        TRUE
      end

      def check_email_format(email)
        email.bytesize > 6 and !(/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/ =~ email).nil?
      end

      def check_email_access(email)
        # TODO: 验证email权限
        TRUE
      end

      def check_email_exist(email, username = '')
        username = db_client.escape(username)
        email = db_client.escape(email)
        sql_add = username != '' ? "AND username<>'#{username}'" : '';
        db_client.query("SELECT email FROM  #{Ucenter::Config.uc_dbtablepre}members WHERE email='#{email}' #{sql_add}").to_a[0]
      end

      def check_mergeuser(username)
        username = db_client.escape(username)
        db_client.query("SELECT count(*) FROM #{Ucenter::Config.uc_dbtablepre}mergemembers WHERE appid='#{Ucenter::Config.app_id}' AND username='#{username}'").to_a[0]
      end

      def add_user
        # TODO: 注册
      end

      def edit_user
        # TODO: 修改
      end

      def delete_user
        # TODO: 删除
      end

      protected
      def get_user_by_username(username)
        db_client.query("SELECT * FROM #{Ucenter::Config.uc_dbtablepre}members WHERE username='#{username}'").to_a[0]
      end

      def get_user_by_uid(username)
        db_client.query("SELECT * FROM #{Ucenter::Config.uc_dbtablepre}members WHERE uid='#{username}'").to_a[0]
      end

      def get_user_by_email(username)
        db_client.query("SELECT * FROM #{Ucenter::Config.uc_dbtablepre}members WHERE email='#{username}'").to_a[0]
      end

      def get_user_by_phone(username)
        db_client.query("SELECT * FROM #{Ucenter::Config.uc_dbtablepre}members WHERE phone='#{username}'").to_a[0]
      end

      private
      def md5 str; Digest::MD5.hexdigest str.to_s end
    end
  end
end

