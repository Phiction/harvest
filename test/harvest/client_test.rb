require "test_helper"

describe Harvest do

  before do
    @connection = Harvest::Connection.new
  end

  describe '#user_agent' do
    it 'defaults HarvestGem/version' do
      connection.user_agent.must_equal "HarvestGem/#{Harvest::VERSION}"
    end
  end

  describe '#user_agent=' do
    it 'overwrites the User-Agent string' do
      connection.user_agent = 'MyHarvestConnection/1.0.0'
      value(connection.user_agent).must_equal 'MyHarvestConnection/1.0.0'
    end
  end

  describe '#credentials?' do
    it 'returns true if the connection access_token/account_id are present' do
      connection = Harvest::Connection.new(access_token: "AT", account_id: "AI")
      value(connection.credentials?).must_equal true
    end

  end

end
