# Copyright (C) 2011-2012 Kenichi Kamiya

require 'csv'
require 'lettercase'
require 'lettercase/ext'
require_relative 'networknodemanager/xnmsnmpconf'
require_relative 'nnm_interval_summarizer/version'

module NNM_Interval_Summarizer

  include NetworkNodeManager

  CSV_OPTIONS = {
    headers: [*Xnmsnmpconf::Entry.members.map{|sym|sym.pascalcase}, :MaxByAlert],
    write_headers: true
  }.freeze

  module_function

  def run
    unless ARGV.length >= 1
      abort "usage: #{$PROGRAM_NAME} ovsnmp.conf [*ovsnmp.conf]"
    end

    ARGV.each do |path|
      begin
        xnmsnmpconf = Xnmsnmpconf.load path
      rescue Exception
        open "#{path}.summarize-error.log", 'w' do |f|
          f.puts($!.inspect, $!.message, $!.backtrace)
        end
      else
        CSV.open "#{path}.summary.csv", 'w', CSV_OPTIONS  do |csv|
          xnmsnmpconf.entries.each do |entry|
            csv << [*entry, entry.max_by_alert]
          end
        end
      end
    end
  end

end