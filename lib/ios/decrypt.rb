class RouterCrypt::IOS
  class << self
    # Decrypts IOS type 7 passwords. Original is from unknown perl source
    # 
    # @param [String] the encrypted string
    # @return [String] the unencrypted string
    def decrypt e_pw
      index = e_pw.slice!(0..1).to_i-1
      e_pw.scan(/../).inject("") do |d_pw, byte|
        index += 1 % KEY.size
        d_pw + (byte.hex ^ KEY[index]).chr
      end
    end
  end
end
