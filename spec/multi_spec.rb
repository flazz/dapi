require 'spec_helper'

# TODO use some test spies
describe Multi do
  let(:handlers) { [ ProbeHandler.new ] * 3 }
  let(:env) { double 'env' }

  before do
    handlers.each { |h| h.stub(:apt?) }
  end

  subject do
    cls = Class.new { include Multi }
    cls.new handlers
  end

  it 'sets the environment on the handlers' do
    subject.env = env
    subject.set_envs
    handlers.each { |h| h.env.should == env }
  end

end
