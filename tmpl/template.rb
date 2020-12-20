#!/usr/bin/env ruby
require 'erb'

class Template
  def template
    raise "Please extend the template method"
  end

  def html
    ERB.new(template).result(binding)
  end
end
