class HomeController < ApplicationController

  before_action do 
	@css_head_home = true
  end

  def index
	@title = 'home'
  end

  def help

  end

  def about

  end


end
