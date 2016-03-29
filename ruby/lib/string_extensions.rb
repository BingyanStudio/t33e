module StringExtensions
  refine String do
    def camelcase(style = :upper)
      str = split(/[\-_\s]/).map { |e| e.capitalize }.join
      case style
      when :upper, true
        str = str.sub(/(\A|\s+)([a-z])/){ $1 + $2.upcase }
      when :lower, false
        str.sub(/(\A|\s+)([A-Z])/){ $1 + $2.downcase }
      end
    end

    def snakecase
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr('-', '_').
        gsub(/\s/, '_').
        gsub(/__+/, '_').
        downcase
    end
  end
end
