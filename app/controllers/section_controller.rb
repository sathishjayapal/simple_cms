class SectionController < ApplicationController
  layout "admin"

  def index
    @sections=Section.sorted
  end

  def show

    @section = Section.find(params[:id])
  end

  def new
    @pages=Page.order('position ASC')
    @position_Count = Section.count +1
    @section=Section.new(:name => 'default section')
  end

  def create
    if params[:section].nil?
      @pages=Page.order('position ASC')
      @position_Count =Section.count
      render('new')
    else
      @section= Section.new(section_params)

      if @section.save
        flash[:notice]= "section created succesfully"
        redirect_to(:action => 'index')
      else
        @pages=Page.order('position ASC')
        @position_Count =Section.count
        render('new')
      end
    end
  end

  def edit

    @section=Section.find(params[:id])
    @pages=Page.order('position ASC')
    @position_Count =Section.count
  end

  def update
    @section=Section.find(params[:id])
    if (@section.update_attributes(section_params))
      flash[:notice]="Section updated succesfully"
      redirect_to(:action => 'index')
    else
      @pages=Page.order('position ASC')
      @position_Count =Section.count
      render(edit)
    end
  end

  def delete
    @section=Section.find(params[:id])
  end

  def destroy
    section=Section.find(params[:id])
    section.destroy
    flash[:notice]= "Section '#{section.name}' destroyed succesfully"
    redirect_to(:action => 'index')
  end

  def section_params
    params.require(:section).permit(:position, :name, :visible, :page_id, :content, :content_type)
  end
end
