# Copyright (C) 2011-2012 Kenichi Kamiya

require 'time/unit'

module NetworkNodeManager; class Xnmsnmpconf
  
  class Parser
  
    class MalformedSourceError < RuntimeError
    end

    SEPARATOR = ':'.freeze
    WILDCARD = '*'.freeze
    RANGE = '-'.freeze
    COMMENT = '#'.freeze
    VALID = /^[^#{COMMENT}]/
    DEFAULT_REMOTE_PORT = 161
    FIELD = "(?:([^#{COMMENT + SEPARATOR}]*?):)".freeze
    FIELD_COUNT = 8

    def initialize(str)
      @string = str
    end
    
    def parse
      entries = []

      @string.lines.grep VALID do |line|
        if matched = /\A#{FIELD * FIELD_COUNT}\Z/o.match(line)
          values = []

          Entry.each_name.with_index do |name, index|
            field = matched.captures[index]
            values << (field && __send__(:"parse_#{name}", field))
          end

          entries << Entry.load_values(*values)
        else
          raise MalformedSourceError, "Unknown format for '#{line}'"
        end
      end
      
      Xnmsnmpconf.new entries
    end
    
    private
    
    def parse_target(str)
      /\A\S+\z/ =~ str ? str : raise(MalformedSourceError)
    end
    
    def parse_get_community(str)
      str.empty? ? nil : str
    end
    
    def parse_proxy(str)
      str.empty? ? raise(MalformedSourceError) : str
    end
    
    def parse_timeout(str)
      str.empty? ? nil : Time::Unit(Rational(str, 10), :second)
    rescue
      raise MalformedSourceError
    end
    
    def parse_retry_count(str)
      str.empty? ? 0 : Integer(str)
    rescue
      raise MalformedSourceError
    end
    
    def parse_status_polling_interval(str)
      str.empty? ? nil : Time::Unit(Integer(str), :second)
    rescue
      raise MalformedSourceError
    end
    
    def parse_remote_port(str)
      str.empty? ? DEFAULT_REMOTE_PORT : Integer(str)
    rescue
      raise MalformedSourceError, str
    end
    
    def parse_set_community(str)
      str.empty? ? nil : str
    end
  
  end
  
end; end