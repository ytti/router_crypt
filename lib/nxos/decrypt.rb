class RouterCrypt::NXOS
  class << self
    # Decrypts NXOS type 7 passwords, original research
    #
    # @param [String] the unencrypted string
    # @return [String] the decrypted string
    def decrypt e_pw
      index = -1
      e_pw.each_char.inject("") do |d_pw, chr|
        index += 1
        d_pw + (ALPHA.include?(chr) ? ALPHA[chr.ord - KEY[index]] : chr)
      end
    end
  end
end
