module Dapi

  module Algebra

    def & other
      All.new [self, other]
    end

    def | other
      First.new [self, other]
    end

  end

end
