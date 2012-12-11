class ElilistsController < ApplicationController
  # GET /elilists
  # GET /elilists.json
  def index
    @elilists = Elilist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @elilists }
    end
  end

  # GET /elilists/1
  # GET /elilists/1.json
  def show
    @elilist = Elilist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @elilist }
    end
  end

  # GET /elilists/new
  # GET /panlists/id/migrate
  def new
    @panlist = Panlist.find_by_id params[:panlist_id]
    unless @panlist
      flash.alert = "Couldn't find panlist with id '#{params[:panlist_id]}'"
      redirect_to '/dashboard'
    end
    @elilist = Elilist.new
    @elilist.members = @panlist.members
    @elilist.name = @panlist.name

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @elilist }
    end
  end

  # GET /elilists/1/edit
  def edit
    @elilist = Elilist.find(params[:id])
  end

  # POST /elilists
  # POST /elilists.json
  def create
    @elilist = Elilist.new(params[:elilist])

    respond_to do |format|
      if @elilist.save
        format.html { redirect_to @elilist, notice: 'Elilist was successfully created.' }
        format.json { render json: @elilist, status: :created, location: @elilist }
      else
        format.html { render action: "new" }
        format.json { render json: @elilist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /elilists/1
  # PUT /elilists/1.json
  def update
    @elilist = Elilist.find(params[:id])

    respond_to do |format|
      if @elilist.update_attributes(params[:elilist])
        format.html { redirect_to @elilist, notice: 'Elilist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @elilist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elilists/1
  # DELETE /elilists/1.json
  def destroy
    @elilist = Elilist.find(params[:id])
    @elilist.destroy

    respond_to do |format|
      format.html { redirect_to elilists_url }
      format.json { head :no_content }
    end
  end
end
