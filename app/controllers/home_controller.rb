require "home.rb"

class HomeController < ApplicationController
  def top
    @home = Home.new
  end

  def result
    home = params[:home].permit(:content, :i, :and_or_on, :c, :re, :j, :output)
    @home =Home.new(home)
  end
end
