#!/usr/bin/env ruby

require_relative "provider"
require_relative "../post"
require_relative '../tmpl/post-details'

require 'org-ruby'
require 'date'

class PostsWriter
  def initialize(posts)
    @posts = posts
  end

  def write
    @posts.each do |post|
      File.write(post.path,
                 PostDetails.new(post).html)
    end
  end
end

class PostsProvider
  def fetch
    dir = "#{Dir.pwd}/posts"
    post_paths = Dir.entries dir

    post_paths
    .select do
        |path| path != '.' and path != '..'
    end
    .map do |path|
      content = File.read("#{dir}/#{path}")

      metadata = parse_metadata(content)

      html = Orgmode::Parser.new(content).to_html
      Post.new(path, html, metadata)
    end
    .sort_by { |p| Date.strptime(p.date, '%Y-%m-%d') }.reverse
  end

  private

  def parse_metadata(content)
    def parse_line(line)
      key = line[2..][/^(.*):/, 1].downcase
      value = line["#+#{key}:".length..].strip
      [key, value]
    end

    # Handle the org files meta data, converts it to a key value dictionary
    content.each_line.select {|line|
        /\#\+\w+\:.+/.match(line)
    }.map{|line| parse_line line}.to_h
  end
end
