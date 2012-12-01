module ActiveModel
  module Validations
    
    class TypeValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        if value.nil?
          return if options[:allow_nil]
        end # tolerate nil values if allow_nil is true
        
        return if options[:as] && options[:in]
        
        klasses = []
        if options[:as]
          klasses << options[:as]
        elsif options[:in]
          return unless options[:in].kind_of? Array
          klasses.concat options[:in]
        else
          return
        end
        
        is_valid = false
        klasses.each do |klass|
          is_valid = true and break if value.kind_of? klass
        end # klasses.each
        
        record.errors.add(attribute, "is not of type: #{klasses}") unless is_valid
      end # def validate_each
    end # class TypeValidator
  
    module HelperMethods
      def validates_type_of(*attr_names)
        validates_with TypeValidator, _merge_attributes(attr_names)
      end # def validates_type_of
    end # module HelperMethods
    
  end #module Validations
end # module ActiveModel