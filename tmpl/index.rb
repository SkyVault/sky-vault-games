#!/usr/bin/env ruby
require 'erb'

require_relative "template"
require_relative "header"

class Index < Template
  def initialize(posts)
    @posts = posts
    @header = Header.new().html
  end

  def template
    %{
    <style>
      body {
        margin: 0;
        background-color: #282828;
        color: #ebdbb2;
        font-size: 1rem;
        font-style: normal;
        font-family: Menlo, Monaco, Lucida Console, Liberation Mono, DejaVu Sans Mono, Bitstream Vera Sans Mono, Courier New, monospace, serif;
      }
    </style>

    <div style="width: 50%; margin-left: auto; margin-right: auto;">

      <%= @header %>
      <h4> == About me == </h4>
      <p style="width: 100%;">
        Lorum ipsum Lorum ipsum Lorum ipsum Lorum ipsum Lorum ipsum Lorum ipsum Lorum ipsum
        Lorum ipsum Lorum ipsum Lorum ipsum Lorum ipsum Lorum ipsum Lorum ipsum Lorum ipsum
        Lorum ipsum Lorum ipsum Lorum ipsum Lorum ipsum Lorum ipsum Lorum ipsum Lorum ipsum
      </p>

      <div style="float: left; width: 50%">
        <h4> == Recent blog posts == </h4>

        <ul>
          <% for @item in @posts.take(6) %>
            <li>
              <a href="<%= @item.path %>"> <%= @item.title %> </a> <%= @item.date %>
            </li>
          <% end %>
        </ul>
        <a href="#"> catagorized blog archive </a>
      </div>

      <div style="float: left; width: 50%">
        <h4> == Notable Projects == </h4>

        Hello world
      </div>
    </div>
    }
  end
end
