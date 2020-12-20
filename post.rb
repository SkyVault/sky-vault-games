#!/usr/bin/env ruby
class Post
  attr_accessor :title, :descr, :date, :tags, :author, :html, :metadata

  def initialize(file, html, metadata)
    @html = html
    @metadata = metadata
    @file = file.sub("org", "html")

    @title = metadata["title"]
    @descr = metadata["description"]
    @date = metadata["date"]
    @tags = metadata["tags"]
    @author = metadata["author"]
  end

  def path
    "#{Dir.pwd}/dist/posts/#{@file}"
  end
end
