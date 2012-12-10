require "spec_helper"

describe ElilistsController do
  describe "routing" do

    it "routes to #index" do
      get("/elilists").should route_to("elilists#index")
    end

    it "routes to #new" do
      get("/elilists/new").should route_to("elilists#new")
    end

    it "routes to #show" do
      get("/elilists/1").should route_to("elilists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/elilists/1/edit").should route_to("elilists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/elilists").should route_to("elilists#create")
    end

    it "routes to #update" do
      put("/elilists/1").should route_to("elilists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/elilists/1").should route_to("elilists#destroy", :id => "1")
    end

  end
end
