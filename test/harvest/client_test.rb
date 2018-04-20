require "test_helper"

describe Harvest do

  before do
    @client = Harvest::Client.new
  end

  describe '#user_agent' do
    it 'defaults HarvestGem/version' do
      @client.user_agent.must_equal "HarvestGem/#{Harvest::VERSION}"
    end
  end

  describe '#user_agent=' do
    it 'overwrites the User-Agent string' do
      @client.user_agent = 'MyHarvestClient/1.0.0'
      value(@client.user_agent).must_equal 'MyHarvestClient/1.0.0'
    end
  end

  describe '#credentials?' do
    it 'returns true if the client access_token/account_id are present' do
      client = Harvest::Client.new(access_token: "AT", account_id: "AI")
      value(client.credentials?).must_equal true
    end

  end

end
