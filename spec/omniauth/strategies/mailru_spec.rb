require 'spec_helper'

describe OmniAuth::Strategies::Mailru do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }
    @request.stub(:cookies) { {} }

    @client_id = '123'
    @client_secret = '53cr3tz'
  end

  subject do
    args = [@client_id, @client_secret, @options].compact
    OmniAuth::Strategies::Mailru.new(nil, *args).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  it_should_behave_like 'an oauth2 strategy'

  describe '#callback_url' do
    it "returns value from #authorize_options" do
      url = 'http://auth.myapp.com/auth/mailru/callback'
      @options = { :callback_url => url }
      subject.callback_url.should eq(url)
    end

    it "callback_url from request" do
      url_base = 'http://auth.request.com'
      @request.stub(:url) { "#{url_base}/page/path" }
      subject.stub(:script_name) { "" } # to not depend from Rack env
      subject.callback_url.should eq("#{url_base}/auth/mailru/callback")
    end
  end
end
