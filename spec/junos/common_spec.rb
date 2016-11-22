require 'router_crypt'


describe RouterCrypt::JunOS, '#nibble' do
  it 'returns k for 1 char out of "kakka"' do
    str = 'kakka'
    nib = RouterCrypt::JunOS.send :nibble, str, 1
    expect(nib).to eq 'k'
    expect(str).to eq 'akka'
  end
  it 'returns kak for 3 char out of "kakka"' do
    str = 'kakka'
    nib = RouterCrypt::JunOS.send :nibble, str, 3
    expect(nib).to eq 'kak'
    expect(str).to eq 'ka'
  end
end

describe RouterCrypt::JunOS, '#gap' do
  it 'returns 7 for gap between k and J' do
    gap = RouterCrypt::JunOS.send :gap, 'k', 'J'
    expect(gap).to eq 7
  end
  it 'returns 56 for gap between J and k' do
    gap = RouterCrypt::JunOS.send :gap, 'J', 'k'
    expect(gap).to eq 56
  end
end

describe RouterCrypt::JunOS, "#gaps" do
  it 'returns ) for [gaps], [dec]' do 
    chr = RouterCrypt::JunOS.send :gap_decode, RouterCrypt::JunOS::ENCODE[1], [9, 42, 12]
    expect(chr).to eq ')'
  end
  it 'returns n for [gaps2], [dec2]' do 
    chr = RouterCrypt::JunOS.send :gap_decode, RouterCrypt::JunOS::ENCODE[5], [42, 69, 99, 4]
    expect(chr).to eq 'n'
  end
end
