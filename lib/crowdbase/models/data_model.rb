module Crowdbase
  class DataModel
    include Toy::Store
    
    class << self
      attr_reader :key_schema, :storage_namespace
      
      def key(*args)
        args.each do |arg|
          raise InvalidKeyFormatError, self unless self.attributes.keys.map { |key| key.to_sym }.include? arg.to_sym
        end
        @key_schema = args
        validates_format_of :id, :with => KEY_SCHEMA_REGEXP
        @key_schema
      end # def key
      
      def store_in(*args)
        raise ArgumentError if args.size != 1 || !(args.first.kind_of?(String) || args.first.kind_of?(Symbol))
        @storage_namespace = args.first.to_sym
      end # def store_in
      
      def storage_namespace
        (@storage_namespace || self.to_s.split("::").last.pluralize.underscore).to_sym
      end # def storage_namespace
    end # class << self
    
    def initialize(*args)
      super
      
      if self.class.key_schema
        self.class.key_schema.each do |key_part|
          self.class_eval %Q"
          def #{key_part}=(val)
            m_name = __method__.to_s
            attr_name = m_name[0, m_name.size-1].to_sym
            self.write_attribute(attr_name, val)
            update_id
            val
          end"
        end
      end # if there is a key_schema
      update_id
    end # def initialize
        
    def update_id
      if self.class.key_schema.blank?
        self.id = nil
        return
      end # if there is no schema, return
      
      self.id = self.class.key_schema.inject("") do |part, elem|
        value = self.send(elem)
        value = Utils.generate_timestamp(value) if value.kind_of? Time
        if part.blank?
          value.to_s
        else
          "#{part}#{KEY_DELIMITER}#{value}"
        end
      end
      self.id = nil if self.id.split(KEY_DELIMITER).blank?
    end # def update_id
    private :update_id
    
    def clear!
      self.attributes.each do |attribute, attr_value|
        if attr_value.kind_of? Hash
          self.__send__("#{attribute}=".to_sym, {})
        elsif attr_value.kind_of? Array
          self.__send__("#{attribute}=".to_sym, [])
        else
          self.__send__("#{attribute}=".to_sym, nil)
        end
      end # set every attribute to nil
    end # def clear!
    
  end # class DataModel
end # module YEL