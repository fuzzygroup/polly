module Nameable
  extend ActiveSupport::Concern

  def hname
    retval = name.split("_").map(&:capitalize).join(" ")
    # All uppercase exemption to capitalization rules
    return "GP" if retval == "Gp"
    return "QA" if retval == 'Qa'
    retval
  end

end
