module Ucenter
  module Tools
    class Xml < Base
      def parse body
        reader = Nokogiri::XML::Reader(body)

        result ||= Hash.new
        vars ||= []

        reader.each do |node|
          if node.name == 'item'
            if vars.include?(node.attributes['id'])
              vars.delete(node.attributes['id'])
            else
              vars << node.attributes['id']
            end
          elsif node.name == '#cdata-section'
            # 只能写出这么渣的代码，求高手调教
            case vars.length
              when 1
                result[vars[0]] = node.value
              when 2
                result[vars[0]] = Hash.new if result[vars[0]].nil?
                result[vars[0]][vars[1]] = node.value
              when 3
                result[vars[0]][vars[1]] = Hash.new if result[vars[0]][vars[1]].nil?
                result[vars[0]][vars[1]][vars[2]] = node.value
              when 4
                result[vars[0]][vars[1]][vars[2]] = Hash.new if result[vars[0]][vars[1]][vars[2]].nil?
                result[vars[0]][vars[1]][vars[2]][vars[3]] = node.value
              when 5
                result[vars[0]][vars[1]][vars[2]][vars[3]] = Hash.new if result[vars[0]][vars[1]][vars[2]][vars[3]].nil?
                result[vars[0]][vars[1]][vars[2]][vars[3]][vars[4]] = node.value
            end
          end
        end
        result
      end
    end
  end
end



