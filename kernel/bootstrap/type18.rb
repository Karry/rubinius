# -*- encoding: us-ascii -*-

module Rubinius
  module Type
    def self.coerce_to_array(obj)
      return [obj] unless obj

      return obj.to_ary if obj.respond_to?(:to_ary)

      # Just call #to_a, which wraps the reciever in an
      # array if it's not one.
      return Rubinius.privately { obj.to_a }
    end

    def self.coerce_to_float(obj, strict=true, must_be_numeric=true)
      case obj
      when String
        coerce_string_to_float obj, strict
      else
        Float_from_except_string(obj)
      end
    end

    def self.convert_to_names(list)
      list.map { |x| x.to_s }
    end

    def self.convert_to_name(sym)
      sym.to_s
    end
  end
end
