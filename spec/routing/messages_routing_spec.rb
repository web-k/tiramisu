require "spec_helper"

describe MessagesController do
  describe "routing" do

    subject { post "channels/1/messages" }
    it { is_expected.to route_to(controller: 'messages', action: 'create', channel_id: '1') }

  end
end
