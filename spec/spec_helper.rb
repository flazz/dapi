require 'rspec/mocks/standalone'
require 'dapi'

class ProbeHandler
  include Handler

  attr_writer :apt

  def apt?
    @apt ||= false
  end

end
