#!/usr/bin/env ruby
require "pathname"
require "./tmpl/index"
require "./data/posts"

class MainSiteBuilder
  @output = ""

  def initialize(output="#{Dir.pwd}/dist/")
    @output = output
  end

  def make_dist_dir
    Dir.mkdir(@output)
    Dir.mkdir("#{@output}/posts")
  end

  def gen()
    make_dist_dir unless File.exists?(@output)

    posts = PostsProvider.new.fetch
    writer = PostsWriter.new posts
    index = Index.new(posts).html

    File.write("#{@output}/index.html", index)
    writer.write
  end
end

builder = MainSiteBuilder.new
builder.gen
