require 'spec_helper'

describe Contact do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :kind }
  
  it "should validate email #valid" do
    subject.email = "abc@abc.com"
    subject.should have_at_least(:no).error_on(:email)
    
    subject.email = "abc2@abc.com.br"
    subject.should have_at_least(:no).error_on(:email)
  end
  
  it "should validate e-mails #invalid" do
    subject.email = "abc"
    subject.should have_at_least(1).error_on(:email)

    subject.email = "!s@abc.com"
    subject.should have_at_least(1).error_on(:email)
    
    subject.email = "a@!d.com"
    subject.should have_at_least(1).error_on(:email)
  end
  
  it "should return kind_enum one array of kinds" do
    kinds =  [ ["Pessoal", 0], ["Empresarial", 1] ]
    kinds.should eq Contact.kind_enum
  end
  
  context "validate associations" do  
    
    let(:contact) { Contact.create(name: "Jimmy", email: "jimmy@example.com.br", kind: 0) }
    
    it "should addresses" do
      contact.addresses << Address.new( address: "Av: XYZ", number: '123', zipcode: '16001-002' )
      contact.addresses.size == 1
    
      contact.addresses << Address.new( address: "Av: ABC", number: '876', zipcode: '16002-002' )
      contact.addresses.size == 2
    end
  
    it "should phones" do
      contact.phones << Phone.new(ddd: "18", number: '9787-9876')
      contact.addresses.size == 1
    
      contact.phones << Phone.new(ddd: "11", number: '3241-7887')
      contact.phones.size == 2
    end
  end
end
