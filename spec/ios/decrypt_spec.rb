require 'spec_helper'
require 'router_crypt'

describe RouterCrypt::IOS, '#decrypt' do
  it 'returns correct decrypted password' do
    clear = RouterCrypt::IOS.decrypt CRYPT_IOS
    expect(clear).to eq CLEAR
  end
end
