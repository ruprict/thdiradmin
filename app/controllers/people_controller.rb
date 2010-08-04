class PeopleController < ApplicationController
  # GET /people
  # GET /people.xml
  def index

    if params[:address_id].blank?
      logger.info("people#index: address_id is blank")
      @people = Person.all
    else
      @address = Address.find(params[:address_id])
      @people = @address.people
      
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

  # GET /people/1
  # GET /people/1.xml
  def show
    
    @person = Person.find(params[:id])
    @address = @person.address
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/new
  # GET /people/new.xml
  def new
    logger.info("people#new")
    if params[:address_id].nil?
      flash[:alert]="You cannot create a person without an address."
      redirect_to root_path
      return
    end
    @address = Address.find(params[:address_id])
    logger.info "people#new: @address=#{@address}"
    @person  = @address.people.build(params[:person])
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/1/edit
  def edit
       
    @person = Person.find(params[:id])
    @address = @person.address
  end

  # POST /people
  # POST /people.xml
  def create
    if params[:address_id].nil?
      flash[:alert]="You cannot create a person without an address."
      redirect_to root_path
      return
    end
    @address = Address.find(params[:address_id])
    @person = @address.people.build(params[:person])

    respond_to do |format|
      if @person.save
        logger.info "people#create: Person saved"
        format.html { redirect_to(address_people_path(@address), :notice => 'Person was successfully created.') }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        
        format.html { render :new }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.xml
  def update

    @person = Person.find(params[:id])
    @address = @person.address

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to(address_people_path(@address), :notice => 'Person was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.xml
  def destroy

    @person = Person.find(params[:id])
    @address = @person.address
    @person.destroy

    respond_to do |format|
      format.html { redirect_to(address_people_path(@address)) }
      format.xml  { head :ok }
    end
  end
end
