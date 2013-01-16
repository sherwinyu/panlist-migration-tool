require 'spec_helper'

describe ElilistsController do

  # This should return the minimal set of attributes required to create a valid
  # Elilist. As you add validations to Elilist, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {"name"=>"directorslistddd",
     "owners_arr"=>["icc7", "rx8", ""],
     "members"=>"a@b.c\r\nd@e.f\r\ng@r.f",
     "list_type"=>"Announcement"}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ElilistsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before :all do
    reset_records
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Elilist" do
        expect {
          post :create, {elilist: valid_attributes}, valid_session
        }.to change(Elilist, :count).by(1)
      end

      it "assigns a newly created elilist as @elilist" do
        post :create, {:elilist => valid_attributes}, valid_session
        assigns(:elilist).should be_a(Elilist)
        assigns(:elilist).should be_persisted
      end

      it "redirects to the created elilist" do
        post :create, {:elilist => valid_attributes}, valid_session
        response.should redirect_to(Elilist.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved elilist as @elilist" do
        # Trigger the behavior that occurs when invalid params are submitted
        Elilist.any_instance.stub(:save).and_return(false)
        post :create, {:elilist => { "name" => "invalid value" }}, valid_session
        assigns(:elilist).should be_a_new(Elilist)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Elilist.any_instance.stub(:save).and_return(false)
        post :create, {:elilist => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "GET index" do
    it "assigns all elilists as @elilists" do
      get :index, {}, valid_session
      assigns(:elilists).should eq(Elilist.all)
    end
  end

  describe "GET show" do
    it "assigns the requested elilist as @elilist" do
      @elilist = Elilist.find_by_name "directorslist"
      get :show, {id: @elilist.id}, valid_session
      assigns(:elilist).should eq(@elilist)
    end
  end

=begin
  describe "GET new" do
    it "assigns a new elilist as @elilist" do
      get :new, {}, valid_session
      assigns(:elilist).should be_a_new(Elilist)
    end
  end

  describe "GET edit" do
    it "assigns the requested elilist as @elilist" do
      elilist = Elilist.create! valid_attributes
      get :edit, {:id => elilist.to_param}, valid_session
      assigns(:elilist).should eq(elilist)
    end
  end


  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested elilist" do
        elilist = Elilist.create! valid_attributes
        # Assuming there are no other elilists in the database, this
        # specifies that the Elilist created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Elilist.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => elilist.to_param, :elilist => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested elilist as @elilist" do
        elilist = Elilist.create! valid_attributes
        put :update, {:id => elilist.to_param, :elilist => valid_attributes}, valid_session
        assigns(:elilist).should eq(elilist)
      end

      it "redirects to the elilist" do
        elilist = Elilist.create! valid_attributes
        put :update, {:id => elilist.to_param, :elilist => valid_attributes}, valid_session
        response.should redirect_to(elilist)
      end
    end

    describe "with invalid params" do
      it "assigns the elilist as @elilist" do
        elilist = Elilist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Elilist.any_instance.stub(:save).and_return(false)
        put :update, {:id => elilist.to_param, :elilist => { "name" => "invalid value" }}, valid_session
        assigns(:elilist).should eq(elilist)
      end

      it "re-renders the 'edit' template" do
        elilist = Elilist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Elilist.any_instance.stub(:save).and_return(false)
        put :update, {:id => elilist.to_param, :elilist => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested elilist" do
      elilist = Elilist.create! valid_attributes
      expect {
        delete :destroy, {:id => elilist.to_param}, valid_session
      }.to change(Elilist, :count).by(-1)
    end

    it "redirects to the elilists list" do
      elilist = Elilist.create! valid_attributes
      delete :destroy, {:id => elilist.to_param}, valid_session
      response.should redirect_to(elilists_url)
    end
  end
=end

end
