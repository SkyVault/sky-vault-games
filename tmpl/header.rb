#!/usr/bin/env ruby

require 'erb'

require_relative "template"

class Header < Template
  def initialize
    @title = "Sky Vault Games"
  end
  def template
    %{
      <h1 style="width: 100%; text-align: center;"> ={ <%= @title %> }= </h1>
      <ul>
        <li> <a href="#"> projects </a> </li>
        <li> <a href="#"> blog </a> </li>
        <li> <a href="#"> youtube </a> </li>
      </ul>
    }
  end
end
