class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
  end

  def new
    @emails = Email.all
  end

  def create
    @email = Email.new(object: Faker::Book.title, body: Faker::Book.title, read: false)

    if @email.save
      respond_to do |format|
        format.html { 
          redirect_to emails_path 
          flash[:notice] = "Email created"
        }
        format.js { }
      end
    else
      redirect_to emails_path
      flash[:notice] = "Please try again"
    end
  end

  def edit
  end

  def update
    @email = Email.find(params[:id])

    # Change email status
    @email.update!(read: !@email.read)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js {}
    end
  end
end
