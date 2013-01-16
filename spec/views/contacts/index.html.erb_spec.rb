require 'spec_helper'

describe "contacts/index" do
  before(:each) do
    assign(:contacts, [
      stub_model(Contact,
        :name => "Name",
        :email => "Email",
        :kind => "Pessoal"
      ),
      stub_model(Contact,
        :name => "Name",
        :email => "Email",
        :kind => "Pessoal"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Pessoal".to_s, :count => 2
    # rendered.should have_content("Name")
  end
end
