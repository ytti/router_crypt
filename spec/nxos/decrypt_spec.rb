require 'spec_helper'
require 'router_crypt'

describe RouterCrypt::NXOS, '#decrypt' do
  it 'returns correct decrypted password' do
    clear = RouterCrypt::NXOS.decrypt CRYPT_NXOS
    expect(clear).to eq CLEAR
  end
end
