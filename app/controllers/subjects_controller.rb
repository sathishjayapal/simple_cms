class SubjectsController < ApplicationController
  layout false
  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject=Subject.new(:name => 'default')
  end

  def create
    if params[:subject].nil?
      render('new')
      else
    
     @subject= Subject.new(subject_params)
    
    if @subject.save
      flash[:notice]= "Subject created succesfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  
  end
  end

  def edit
    @subject = Subject.find(params[:id])
  end
  def update
     @subject=Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice]= "Subject updated succesfully"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end
    
  
  def delete
     @subject = Subject.find(params[:id])
  end
  def destroy
    subject = Subject.find(params[:id])
     subject.destroy
     flash[:notice]= "Subject '#{subject.name}' destroyed succesfully"
     redirect_to(:action=>'index')
    end
  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end