require "spec_helper"

describe MessagesController do
  describe "routing" do

    it "routes to #create" do
      post("channels/1/messages").should route_to(controller: 'messages', action: 'create', channel_id: '1')
    end

  end
end
