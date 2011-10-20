module Dapi

  # TODO should this be made binary? could be simpler
  class All
    include Multi

    def apt?
      set_envs
      all_apt?
    end

    def all_apt?
      handlers.all? &:apt?
    end

  end

end
