require 'rspec/mocks/standalone'
require 'dapi'

include Dapi

class ProbeHandler
  include Handler

  attr_writer :apt

  def apt?
    @apt ||= false
  end

end
