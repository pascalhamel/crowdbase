module Crowdbase
  class Log
    include Log4r
    
    class << self
      
      attr_reader :logger
      def logger
        @logger ||= Log4r::Logger.new("Crowdbase", nil, true, false)
      end # def logger
    
      def initialize_outputters
        return nil unless self.logger.outputters.size.zero?
        file_outputter = nil
        case Crowdbase.env
        when "test"
          file_outputter = Log4r::FileOutputter.new("file_logger", :filename =>Crowdbase.root.join("#{LOG_DIR}/#{Crowdbase.env}.log").to_s, :trunc => true)
        else
          file_outputter = Log4r::FileOutputter.new("file_logger", :filename =>Crowdbase.root.join("#{LOG_DIR}/#{Crowdbase.env}.log").to_s)
        end # case
        
        self.logger.outputters = [Log4r::Outputter.stdout, file_outputter]
        nil
        
        self.logger.levels.select { |level| !%w(ALL OFF).include? level }.each do |level|
          method_string = %-
            def #{level.downcase}(*data)
              data = Array(yield) if block_given?
              message = "[\#{caller[0].split('/').last}]: \#{data.first.to_s}"
              self.logger.#{level.downcase} message
              nil
            end
          -
          self.instance_eval(method_string)
        end # each valid logging level
      end # def check_logger
    
    end # class << self
  end # class Logger
end # module Crowdbase