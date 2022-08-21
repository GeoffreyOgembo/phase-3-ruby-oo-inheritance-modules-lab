module Paramable
  module InstanceMethods
    def to_param
      name.downcase.tr(" ", "-")
    end
  end
end