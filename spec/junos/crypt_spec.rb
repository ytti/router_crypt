require 'spec_helper'
require 'router_crypt'

describe RouterCrypt::JunOS, '#crypt' do
  it 'returns correct crypted password' do
    crypt = RouterCrypt::JunOS.crypt CLEAR
    clear = RouterCrypt::JunOS.decrypt crypt
    clear.should eq CLEAR
  end
end
