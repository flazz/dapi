require 'spec_helper'

describe First do
  let(:handlers) { Array.new(3) { ProbeHandler.new } }
  let(:action) { double 'action' }
  before { action.stub :call }

  subject { First.new handlers }

  context 'with an apt handler' do
    let(:apt_handler) { handlers[1] }
    before { apt_handler.apt = true }
    before { apt_handler.action = action }

    let(:inept_handlers) { [ handlers[0], handlers[2] ] }

    it { should be_apt }

    it 'dispatches to the apt handler' do
      apt_handler.should_receive :dispatch
      subject.dispatch
    end

    it 'skips the inept handlers' do
      inept_handlers.each { |h| h.should_not_receive :dispatch }
      subject.dispatch
    end

  end

  context 'with no apt handler' do
    it { should_not be_apt }

    it 'does not dispatch' do
      handlers.each { |h| h.should_not_receive :dispatch }
      lambda { subject.dispatch }
    end

    it 'raises an error' do
      lambda { subject.dispatch }.should raise_error('no apt handler')
    end

  end

end
