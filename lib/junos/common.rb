class RouterCrypt::JunOS
  class InvalidPW < StandardError; end
  
  ENCODE = [
      [ 1,  4, 32 ],
      [ 1, 16, 32 ],
      [ 1,  8, 32 ],
      [ 1, 64     ],
      [ 1, 32     ],
      [ 1, 4, 16, 128 ],
      [ 1, 32, 64 ],
  ]
  EXTRA   = {}
  KEY     = %w( QzF3n6/9CAtpu0O B1IREhcSyrleKvMW8LXx 7N-dVbwsY2g4oaJZGUDj iHkq.mPf5T )
  KEYCHAR = KEY.join.each_char.to_a
  KEY.each_with_index do |key, index|
    key.each_char { |c| EXTRA[c] = 3-index }
  end
  
  class << self
  
    private 
 
    def nibble str, len
      nib, str[0..len-1] = str[0..len-1], ''
      nib.size == len or raise InvalidPW, 'Insufficent amont of characters'
      nib
    end
  
    def gap c1, c2
      (KEYCHAR.index(c1) - KEYCHAR.index(c2)) % KEYCHAR.size - 1 
    end
  
    def gap_decode gaps, dec
      gaps.size == dec.size or raise InvalidPW, 'gaps and dec are unequal size'
      (gaps.each_with_index.inject(0) { |num, (e, index)| num + e * dec[index] } % 256).chr
    end
  
  end
end
