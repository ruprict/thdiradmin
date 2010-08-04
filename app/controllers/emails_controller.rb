class EmailsController < ApplicationController
  def index
    @person = Person.find(params[:person_id])
    @emails = @person.emails
    respond_to do |format| 
      format.html #index.html.erb
      format.xml {render :xml => @emails}
    end
  end

  def create
    @person = Person.find(params[:person_id])
    @email= @person.emails.build(params[:email])
    
    respond_to do |format|
      if @person.save
        format.html {redirect_to(person_emails_path(@person), :notice => "Email successfully created")}
        format.xml {render :xml=>@email, :status => :created, :location => @email }
      else
        format.html { render :new }
        format.xml  { render :xml => @email.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
  end

  def update
    @person = Person.find(params[:person_id])
    @email = Email.find(params[:id])
    
    respond_to do |format|
      if @email.update_attributes(params[:email])
        format.html {redirect_to(address_person_path(@person.address, @person), :notice => "Email successfully updated.")}
        format.xml { head :ok}
      else
        format.html { render :action => "edit"  }
        format.xml  { render :xml => @email.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @person = Person.find(params[:person_id])
    @email = Email.find(params[:id])
    
    @email.destroy
    
    respond_to do |format|
      format.html {redirect_to address_person_path(@person.address, @person), :notice => "Email successfully deleted"}
      format.xml {head :ok}
    end
  end

  def edit
    @person = Person.find(params[:person_id])
    @email = Email.find(params[:id])
  end

  def new
    @person = Person.find(params[:person_id])
    #Todo: Check 
    @email = @person.emails.build(params[:email])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @email }
    end
  end

end
