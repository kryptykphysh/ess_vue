require "rails_helper"

RSpec.describe MachineStatusesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/machine_statuses").to route_to("machine_statuses#index")
    end

    it "routes to #new" do
      expect(:get => "/machine_statuses/new").to route_to("machine_statuses#new")
    end

    it "routes to #show" do
      expect(:get => "/machine_statuses/1").to route_to("machine_statuses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/machine_statuses/1/edit").to route_to("machine_statuses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/machine_statuses").to route_to("machine_statuses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/machine_statuses/1").to route_to("machine_statuses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/machine_statuses/1").to route_to("machine_statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/machine_statuses/1").to route_to("machine_statuses#destroy", :id => "1")
    end

  end
end
