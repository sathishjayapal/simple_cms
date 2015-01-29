class SectionController < ApplicationController
  layout false
  def index
    @sections=Section.all
  end

  def show
     @section = Section.find(params[:id])
  end

  def new
    @section=Section.new(:name => 'default section')
  end

  def create
     if params[:section].nil?
      render('new')
      else
     @section= Section.new(section_params)
    
    if @section.save
      flash[:notice]= "section created succesfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end
end
