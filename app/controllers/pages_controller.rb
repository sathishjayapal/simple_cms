class PagesController < ApplicationController
  layout "admin"

  def index
    @pages= Page.all
  end

  def show
    @page=Page.find(params[:id])
  end

  def new
    page=Page.new(:name => 'default')
    @subjects=Subject.order('position ASC')
    @page_count =Page.count +1
  end

  def create
    if params[:id].nil?
      render('new')
    else
      @page=Page.save(pages_params)
      if @page.save
        flash[:notice]="Page saved succesfully"
        redirect_to(:action => index)
      else
        @subject=Subject.order('position ASC')
        @page_count =Page.count
        render new
      end
    end
  end

  def edit
    @page=Page.find(params[:id])
    @subject=Subject.order('position ASC')
    @page_count =Page.count

  end

  def update
    # @page=Page.find(params[:id]
    #   if @page.update_attributes(pages_params)
    #     flash[:notice]="Page updated succesfully"
    #     redirect_to(:action=>'index')
    #     else
    #       render(edit)
    #     end
  end

  def delete
    @page=Page.find(params[:id])
  end

  def destroy
    page=Page.find(params[:id])
    page.destroy
    flash[:notice]= "page '#{page.name}' destroyed succesfully"
    redirect_to(:action => 'index')
  end

  def pages_params
    params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
  end
end
