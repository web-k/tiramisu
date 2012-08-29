require 'spec_helper'

describe "messages/index" do
  before(:each) do
    assign(:messages, [
      stub_model(Message,
        :content => "Content",
        :created_at => Time.now
      ),
      stub_model(Message,
        :content => "Content",
        :created_at => Time.now
      )
    ])
    assign(:message,
      stub_model(Message,
        :content => "Content",
        :created_at => Time.now
      )
    )
  end

  it "renders a list of messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
