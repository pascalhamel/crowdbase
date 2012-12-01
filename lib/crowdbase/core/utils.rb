module Crowdbase
  module Utils
    class << self
      
      def recursive_symbolize_keys!(hash)
        hash.symbolize_keys!
        hash.values.each do |h|
          if h.kind_of? Array
            h.each { |vv| recursive_symbolize_keys!(vv) if vv.kind_of? Hash }
          elsif h.kind_of? Hash
            recursive_symbolize_keys!(h)
          end # if
        end # each value
      end # def recursive_symbolize_keys!

      def recursive_merge_hashes(h1, h2)
        h3 = h1.merge(h2) do |k, v1, v2|
          if (v1.kind_of? Hash) && (v2.kind_of? Hash)
            self.recursive_merge_hashes(v1, v2)
          else
            v2
          end
        end
      end # def recursive_merge_hashes
      
    end # class << self
  end # module Utils
end # module Crowdbase