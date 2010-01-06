module Webrat
  class Scope
    protected
      def scoped_dom
        begin
          @scope.dom.css(@selector).first
        rescue Nokogiri::CSS::SyntaxError, Nokogiri::XML::XPath::SyntaxError => e
          begin
            @scope.dom.xpath(@selector).first
          rescue Nokogiri::XML::XPath::SyntaxError
            raise e
          end
        end
      end
  end
end