# Copyright (C) 2011-2012 Kenichi Kamiya

module NetworkNodeManager

  class Xnmsnmpconf
    
    class << self
    
      def parse(str)
        self::Parser.new(str).parse
      end
      
      def for_io(io)
        parse io.read
      end
      
      def load_file(path)
        open path do |f|
          return for_io(f)
        end
      end
      
      alias_method :load, :load_file

    end
    
    attr_reader :entries
    
    def initialize(entries)
      @entries = entries
    end
  
  end

end

require_relative 'xnmsnmpconf/entry'
require_relative 'xnmsnmpconf/parser'