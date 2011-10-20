require 'spec_helper'

describe All do
  let(:handlers) { Array.new(3) { ProbeHandler.new } }
  before { handlers.each { |h| h.apt = true } }
  subject { All.new handlers }

  context 'with all apt handlers' do
    it { should be_apt }
  end

  context 'with some inept handlers' do
    before { handlers.first.apt = false }
    it { should_not be_apt }
  end

end
