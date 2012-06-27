# Copyright (C) 2011-2012 Kenichi Kamiya

require 'striuct'
require 'time/unit'

module NetworkNodeManager; class Xnmsnmpconf

  class Entry < Striuct
  
    TIMEOUT_INCREASE_RADIX = 2
    
    member :target, AND(String, /\A\S+\z/)
    member :get_community, OR(AND(String, /\A\S+\z/), nil)
    member :proxy, AND(String, /\A\S+\z/)
    member :timeout, OR(Time::Unit, nil)
    member :retry_count, AND(Fixnum, ->v{v >= 0})
    member :status_polling_interval, OR(Time::Unit, nil)
    member :remote_port, AND(Integer, 0..65535)
    member :set_community, OR(AND(String, /\A\S+\z/), nil)
    close_member
    
    def max_by_alert
      status_polling_interval && retry_count && timeout &&

      (0..retry_count).inject(status_polling_interval){|sum, n|
        sum + (timeout * (TIMEOUT_INCREASE_RADIX ** n))
      }
    end

  end

end; end
