require 'spec_helper'
require 'router_crypt'

describe RouterCrypt::IOS, '#decrypt' do
  it 'returns correct decrypted password' do
    clear = RouterCrypt::IOS.decrypt CRYPT_IOS
    clear.should eq CLEAR
  end
end
