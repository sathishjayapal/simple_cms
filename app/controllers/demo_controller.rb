class DemoController < ApplicationController
layout false
  def index
  	@id=params['id'].to_i
  	@page=params[:page].to_i
  	render("index")
  end
  def hello	
  	render("hello")
  end
  def google
  	redirect_to("http://google.com")
  end
  def demoarray
  	@array=[1,2,3,4]
  	render "hello"
  end
end
