require 'spec_helper'

describe OmniAuth::Strategies::Mailru do
  def app; lambda{|env| [200, {}, ["Hello."]]} end
  let(:fresh_strategy){ Class.new(OmniAuth::Strategies::Mailru) }

  it 'should do some testing' do
    pending
  end

end
