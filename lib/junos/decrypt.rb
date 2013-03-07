class RouterCrypt::JunOS
  class << self
    # Decrypts JunOS $9$ style passwords. This is reimplementation of CPAN 
    # Crypt::Juniper (by Kevin Brintnall, <kbrint at rufus.net>)  ''juniper_decrypt' function
    #
    # @param [String] the encrypted string, with or without $9$ in front of it
    # @return [String] the unencrypted string
    def decrypt e_pw
      e_pw  = e_pw[3..-1] if e_pw['$9$']
      d_pw  = ''
      prev  = nibble e_pw, 1
      nibble e_pw, EXTRA[prev]
  
      while e_pw.size > 0
        decode = ENCODE[d_pw.size % ENCODE.size]
        gaps   = nibble(e_pw, decode.size).each_char.map do |e|
          g    = gap e, prev
          prev = e
          g
        end
        d_pw += gap_decode gaps, decode
      end

      d_pw
    end
  end
end
