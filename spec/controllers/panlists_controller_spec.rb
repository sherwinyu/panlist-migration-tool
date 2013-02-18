require 'spec_helper'

describe PanlistsController do

  # This should return the minimal set of attributes required to create a valid
  # Panlist. As you add validations to Panlist, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {name:  "sherwinlist" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PanlistsController. Be sure to keep this updated too.
  def valid_session
    {cas_user: 'sy23'}
  end

  before :all do
    reset_records
  end

  describe "GET show" do
    it "assigns the requested panlist as @panlist" do
      panlist = Panlist.last
      get :show, {id: panlist.id}, valid_session
      assigns(:panlist).should eq(panlist)
      response.should_not be_redirect
    end

    describe "on a nonexistent panlist" do
      it "should redirect to the panlist" do
        get :show, { id: 'nonexistentid' }, valid_session
        response.should redirect_to '/dashboard'
      end
    end

  end

  describe "GET migrate" do
    describe "on a nonexistent panlist" do
      it "should redirect to the panlist" do
        get :show, { id: 'nonexistentid' }, valid_session
        response.should redirect_to '/dashboard'
      end
    end
    describe "on valid panlist" do
      before :each do
        @panlist = Panlist.find_by_list_name 'directorslist'
        get :migrate, { id: @panlist.id }, valid_session
      end

      it "should only let you migrate a list you own"

      it "should initialize elilist from panlist" do
        assigns(:elilist).should be_a_new Elilist
        assigns(:elilist).name.should eq @panlist.name
        assigns(:elilist).owners_raw.should eq @panlist.owners.map(&:netid) * "\n"
        assigns(:elilist).subscribers_raw.should eq "a@b.c\nd@e.f\ng@r.f"
      end
    end
  end


  describe "GET index" do
    it "assigns all panlists as @panlists" do
      panlist = Panlist.create! valid_attributes
      get :index, {}, valid_session
      assigns(:panlists).should eq(Panlist.all)
    end
  end


=begin
  describe "GET new" do
    it "assigns a new panlist as @panlist" do
      get :new, {}, valid_session
      assigns(:panlist).should be_a_new(Panlist)
    end
  end

  describe "GET edit" do
    it "assigns the requested panlist as @panlist" do
      panlist = Panlist.create! valid_attributes
      get :edit, {:id => panlist.to_param}, valid_session
      assigns(:panlist).should eq(panlist)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Panlist" do
        expect {
          post :create, {:panlist => valid_attributes}, valid_session
        }.to change(Panlist, :count).by(1)
      end

      it "assigns a newly created panlist as @panlist" do
        post :create, {:panlist => valid_attributes}, valid_session
        assigns(:panlist).should be_a(Panlist)
        assigns(:panlist).should be_persisted
      end

      it "redirects to the created panlist" do
        post :create, {:panlist => valid_attributes}, valid_session
        response.should redirect_to(Panlist.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved panlist as @panlist" do
        # Trigger the behavior that occurs when invalid params are submitted
        Panlist.any_instance.stub(:save).and_return(false)
        post :create, {:panlist => { "name" => "invalid value" }}, valid_session
        assigns(:panlist).should be_a_new(Panlist)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Panlist.any_instance.stub(:save).and_return(false)
        post :create, {:panlist => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested panlist" do
        panlist = Panlist.create! valid_attributes
        # Assuming there are no other panlists in the database, this
        # specifies that the Panlist created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Panlist.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => panlist.to_param, :panlist => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested panlist as @panlist" do
        panlist = Panlist.create! valid_attributes
        put :update, {:id => panlist.to_param, :panlist => valid_attributes}, valid_session
        assigns(:panlist).should eq(panlist)
      end

      it "redirects to the panlist" do
        panlist = Panlist.create! valid_attributes
        put :update, {:id => panlist.to_param, :panlist => valid_attributes}, valid_session
        response.should redirect_to(panlist)
      end
    end

    describe "with invalid params" do
      it "assigns the panlist as @panlist" do
        panlist = Panlist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Panlist.any_instance.stub(:save).and_return(false)
        put :update, {:id => panlist.to_param, :panlist => { "name" => "invalid value" }}, valid_session
        assigns(:panlist).should eq(panlist)
      end

      it "re-renders the 'edit' template" do
        panlist = Panlist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Panlist.any_instance.stub(:save).and_return(false)
        put :update, {:id => panlist.to_param, :panlist => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested panlist" do
      panlist = Panlist.create! valid_attributes
      expect {
        delete :destroy, {:id => panlist.to_param}, valid_session
      }.to change(Panlist, :count).by(-1)
    end

    it "redirects to the panlists list" do
      panlist = Panlist.create! valid_attributes
      delete :destroy, {:id => panlist.to_param}, valid_session
      response.should redirect_to(panlists_url)
    end
  end
=end

end
