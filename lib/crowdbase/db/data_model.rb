module Crowdbase
  class DataModel
    include Toy::Store
    
    class << self
      attr_reader :storage_namespace
      
      def store_in(*args)
        raise ArgumentError if args.size != 1 || !(args.first.kind_of?(String) || args.first.kind_of?(Symbol))
        @storage_namespace = args.first.to_sym
      end # def store_in
      
      def storage_namespace
        (@storage_namespace || self.to_s.split("::").last.pluralize.underscore).to_sym
      end # def storage_namespace
    end # class << self
    
    def from_resource(resource)
      raise MalformedResourceError unless resource.kind_of? String or resource.kind_of? Hash
      resource = JSON.parse resource if resource.kind_of? String
      Utils.recursive_symbolize_keys!(resource) if resource.kind_of? Hash
      resource.each do |property, value|
        next if (value.kind_of? Hash) || (value.kind_of? Array)
        setter = "#{property}=".to_sym
        self.__send__(setter, value) if self.respond_to? setter
      end # store each valid property passed
      self
    rescue => ex
      Log.warn "Unable to build object from resource: #{ex.inspect}"
      raise MalformedResourceError
    end # def from_resource
    
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