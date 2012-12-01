module ActiveModel
  module Validations
    
    class TypeListValidator < ActiveModel::EachValidator
      
      def validate_each(record, attribute, value)
        if value.nil?
          return if options[:allow_nil]
        end # tolerate nil values if allow_nil is true
        
        klass = options[:as]
        return unless klass
        
        if value.kind_of? Hash
          value.each do |element_key, element_value|
            unless element_value.kind_of? klass
              record.errors[attribute] << { element_key.to_sym => "is not of type: #{klass}"}
            end
          end # each
        end # validate each element in the hash
        
        if value.kind_of? Array
          value.each_with_index do |element, index|
            unless element.kind_of? klass
              record.errors[attribute] << { index.to_s.to_sym => "is not of type: #{klass}"}
            end
          end # each_with_index
        end # validate each element in the array
      end # def validate_each
    end # class TypeValidator
  
    module HelperMethods
      def validates_elements_of(*attr_names)
        validates_with TypeListValidator, _merge_attributes(attr_names)
      end # def validates_type_of
    end # module HelperMethods
    
  end #module Validations
end # module ActiveModel