class MigrationsController < ApplicationController

  def dashboard
    net_id = if admins.include? current_user and params[:fake_net_id] 
               params[:fake_net_id]
             else
               current_user
             end
    @owner = Owner.find_or_initialize_by_netid net_id

    @lists = @owner.panlists
  end
end

__END__
  # GET /panlists
  # GET /panlists.json

  def index
    @panlists = Panlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @panlists }
    end
  end

  # GET /panlists/1
  # GET /panlists/1.json
  def show
    @panlist = Panlist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @panlist }
    end
  end

  # GET /panlists/new
  # GET /panlists/new.json
  def new
    @panlist = Panlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @panlist }
    end
  end

  # GET /panlists/1/edit
  def edit
    @panlist = Panlist.find(params[:id])
  end

  # POST /panlists
  # POST /panlists.json
  def create
    @panlist = Panlist.new(params[:panlist])

    respond_to do |format|
      if @panlist.save
        format.html { redirect_to @panlist, notice: 'Panlist was successfully created.' }
        format.json { render json: @panlist, status: :created, location: @panlist }
      else
        format.html { render action: "new" }
        format.json { render json: @panlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /panlists/1
  # PUT /panlists/1.json
  def update
    @panlist = Panlist.find(params[:id])

    respond_to do |format|
      if @panlist.update_attributes(params[:panlist])
        format.html { redirect_to @panlist, notice: 'Panlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @panlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /panlists/1
  # DELETE /panlists/1.json
  def destroy
    @panlist = Panlist.find(params[:id])
    @panlist.destroy

    respond_to do |format|
      format.html { redirect_to panlists_url }
      format.json { head :no_content }
    end
  end
end
