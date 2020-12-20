#!/usr/bin/env ruby

require 'erb'

require_relative "template"

class PostDetails < Template
  def initialize(post)
    @post = post
  end

  def template
    %{
    <a href="../index.html"> home </a>
    <p> <%= @post.date %> </p>
    <%= @post.html %>
    }
  end
end
