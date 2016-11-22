require 'slop'
require 'pp'


class RouterCrypt::CLI
  class << self
    def run
      opts=opts_parse.to_hash
      #ARGV[0] or raise ArgumentError, 'no password given'

      if opts[:junipercrypt]
        pw=opts[:junipercrypt]
	if opts[:salt]
          RouterCrypt::JunOS.crypt(opts[:junipercrypt], opts[:salt])
        else
          RouterCrypt::JunOS.crypt opts[:junipercrypt]
        end
      elsif opts [:decrypt]
        pw=opts[:decrypt].dup
        case pw
        when /^\$9\$/
          RouterCrypt::JunOS.decrypt pw
        when /^[\dA-F]+$/
          RouterCrypt::IOS.decrypt pw
        else
          #presume it's NXOS, no clear way to separate garbage and NXOS PW
          RouterCrypt::NXOS.decrypt pw
        end
      end
    end

    def opts_parse
      Slop.parse do |o|
        o.on     '-h', '--help' do puts o; exit; end
        o.bool   '-D', '--debug',        'turn on debugging'
        o.string '-j', '--junipercrypt', 'crypt Juniper'
        o.string '-s', '--salt',         'salt for crypt'
	o.string '-d', '--decrypt',      'decrypt'
      end
    end

  end
end
