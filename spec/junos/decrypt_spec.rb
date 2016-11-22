require 'spec_helper'
require 'router_crypt'

describe RouterCrypt::JunOS, '#decrypt' do
  it 'returns correct decrypted password' do
    clear = RouterCrypt::JunOS.decrypt CRYPT_JUNOS
    expect(clear).to eq CLEAR
  end
end
