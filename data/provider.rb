#!/usr/bin/env ruby

class Provider
  def fetch
    raise "Provider does not extend this method"
  end
end
