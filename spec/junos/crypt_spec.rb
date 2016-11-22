require 'spec_helper'
require 'router_crypt'

describe RouterCrypt::JunOS, '#crypt' do
  it 'returns correct crypted password' do
    crypt = RouterCrypt::JunOS.crypt CLEAR
    clear = RouterCrypt::JunOS.decrypt crypt
    expect(clear).to eq CLEAR
  end
end
