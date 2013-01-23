require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ContactsHelper. For example:
#
# describe ContactsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ContactsHelper do
  describe "filter" do
    it "#Empresarial should add class on" do
      params = { kind: '1' }
      helper.stub!(:params).and_return(params)
      helper.filter('Empresarial', 1).should == "<a href=\"/contacts?kind=1\" class=\"on\">Empresarial (0)</a>"
      helper.filter('Pessoal', 0).should == "<a href=\"/contacts?kind=0\">Pessoal (0)</a>"
      helper.filter('Ambos').should == "<a href=\"/contacts\">Ambos (0)</a>"
    end
    
    it "#Pessoal should add class on" do
      params = { kind: '0' }
      helper.stub!(:params).and_return(params)
      helper.filter('Empresarial', 1).should == "<a href=\"/contacts?kind=1\">Empresarial (0)</a>"
      helper.filter('Pessoal', 0).should == "<a href=\"/contacts?kind=0\" class=\"on\">Pessoal (0)</a>"
      helper.filter('Ambos').should == "<a href=\"/contacts\">Ambos (0)</a>"
    end
    
    it "#Ambos should add class on" do
      params = { }
      helper.stub!(:params).and_return(params)
      helper.filter('Empresarial', 1).should == "<a href=\"/contacts?kind=1\">Empresarial (0)</a>"
      helper.filter('Pessoal', 0).should == "<a href=\"/contacts?kind=0\">Pessoal (0)</a>"
      helper.filter('Ambos').should == "<a href=\"/contacts\" class=\"on\">Ambos (0)</a>"
    end
  end
end
