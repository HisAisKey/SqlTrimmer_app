require "home.rb"

class HomeController < ApplicationController
  def top
    @home = Home.new
  end

  def result
    home = params[:home].permit(:content)
    @home =Home.new(home)
  end
end
