class EmailsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_trash, only: [:move_trash]
  skip_before_action :verify_authenticity_token
	before_action :set_delete, only: [:delete_draft]

  def index
  	@email = Email.order(id: :desc)
  end

  def new
  	@email = Email.new
  end

  def create

  	@email = Email.new(resource_params)
  	@email.user = current_user
  	@email.status = params[:commit]
    	if @email.save
    		flash[:notice] = "Anda Berhasil Mengirim Email Ke '#{@email.recipients}' "
    		redirect_to root_path
    	else
      flash[:notice] = "Email yang dituju tidak ada!!"
      @email.delete
      redirect_to new_email_path
    	end

  end

  def show
  	@email = Email.find(params[:id])
  end

  def sent
  	@email = Email.order(id: :desc)
  end

  def trash
  	@email = Email.order(id: :desc)
  end

  def draft
  	@email = Email.new
  	@email = Email.order(id: :desc)
  end

  def move_trash
  	emails = Email.find(params[:id])
  	emails.update_attribute(:status, "trash")

  	if emails.save
	  	redirect_to trash_emails_path
  		flash[:notice] = "Move to Trash Message '#{emails.subject}' "
	  else
	  	redirect_to 'new'
  	end
  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
      @email.update(resource_params)
      @email.update(status: 'sent')
      flash[:notice] = "Update Draft Succes"

      redirect_to root_path
  end

  def delete_trash
    email = Email.find(params[:id])
    email.update_attribute(:status, "delete")

    if email.save
      redirect_to trash_emails_path
      flash[:notice] = "Delete Message '#{email.subject}' "
    else
      redirect_to trash_emails_path
    end
  end

  private

  def resource_params
		params.require(:email).permit(:recipients, :subject, :message, :attachment)
  end

  def set_trash
  	@email = Email.find_by_id(params[:id])
  end

  def delete_draft
    @email = Email.find_by_id(params[:id])
  end

end
