class PhoneNumbersController < ApplicationController
  
  def index
    @address = Address.find(params[:address_id])
    @phone_numbers=@person.phone_numbers
  end
  
  def new
    @address = Address.find(params[:address_id])
    @phone_number = @address.phone_numbers.build(params[:PhoneNumber])
  end
  
  def create

    @address = Address.find(params[:address_id])
    @phone_number = @address.phone_numbers.build(params[:phone_number])
    respond_to do |format|
      if @phone_number.save
        logger.info "phone_number#create: Phone saved"
        format.html { redirect_to(address_path(@address), :notice => 'Phone Number was successfully created.') }
        format.xml  { render :xml => @phone_number, :status => :created, :location => @phone_number }
      else
        logger.info "phone_number#create:  Phone NOT saved"
        logger.info @phone_number.errors.any?
        format.html { render :new }
        format.xml  { render :xml => @phone_number.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @phone_number = PhoneNumber.find(params[:id])
    @address = @phone_number.address
    respond_to do |format|
      format.html
      format.xml {render :xml => @phone_number} 
    end
  end
  
  def update
    @phone_number = PhoneNumber.find(params[:id])
    @address = @phone_number.address
    respond_to do |format|
      if @phone_number.update_attributes(params[:phone_number])
        format.html { redirect_to(address_path(@address), :notice => 'Phone Number was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action =>"edit" }
        format.xml  { render :xml => @phone_number.errors, :status => :unprocessable_entity }
      end
      
    end
  end
  
  
  def destroy
    @phone_number = PhoneNumber.find(params[:id])
    respond_to do |format|
      if @phone_number.destroy
        format.html { redirect_to(address_path(@phone_number.address), :notice=>"Phone Number was sucessfully deleted.")}
        format.xml{head :ok}
      else
        
      end
    end
  end
  
end
