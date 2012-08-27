$VERSION = true

require 'test/declare'
require_relative '../lib/networknodemanager/xnmsnmpconf'

sample =<<EOD
#
#
#
192.168.1.100:foo:*:2:3:4::bar:
EOD

The NetworkNodeManager::Xnmsnmpconf.parse(sample).entries do |entries|
  
  The entries.length do
    is 1
  end
  
  The entries.first do |entry|
    
    The entry.target do
      is '192.168.1.100'
    end
    
    The entry.get_community do
      is 'foo'
    end

    The entry.proxy do
      is '*'
    end

    The entry.timeout do |timeout|
      is_a Time::Unit
    
      The timeout.millisecond do
        is 200
      end
    end

    The entry.retry_count do
      is 3
    end

    The entry.status_polling_interval do |interval|
      is_a Time::Unit
      
      The interval.second do
        is 4
      end
    end

    The entry.remote_port do
      is 161
    end

    The entry.set_community do
      is 'bar'
    end
    
    The entry.max_by_alert do |mba|
      is_a Time::Unit
      
      The mba.second do
        is 7
      end
    end
  
  end

end

