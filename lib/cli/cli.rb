class RouterCrypt::CLI
  class << self
    def run
      pw = ARGV[0].dup or raise ArgumentError, 'no password given'
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
end
