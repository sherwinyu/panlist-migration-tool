require "spec_helper"

describe PanlistsController do
  describe "routing" do

    it "routes to #index" do
      get("/panlists").should route_to("panlists#index")
    end

    it "routes to #new" do
      get("/panlists/new").should route_to("panlists#new")
    end

    it "routes to #show" do
      get("/panlists/1").should route_to("panlists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/panlists/1/edit").should route_to("panlists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/panlists").should route_to("panlists#create")
    end

    it "routes to #update" do
      put("/panlists/1").should route_to("panlists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/panlists/1").should route_to("panlists#destroy", :id => "1")
    end

  end
end
