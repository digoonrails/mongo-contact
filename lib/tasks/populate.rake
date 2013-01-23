namespace :db do
  desc "Populate database for tests"
  task :populate, [:args1] => [:environment] do
    require 'ffaker'
    
    def number_phone
      "#{rand(9999)}-#{rand(9999).to_s.ljust(4, '0')}"
    end

    # Delete_all
    [Address, Phone, Contact].each(&:delete_all)
    
    (0..50).each do |i|
      contact = Contact.create(name: Faker::Name.name, email: Faker::Internet.email, kind: rand(2))
      contact.addresses << Address.create(address: Faker::Address.street_name, number: rand(999), zipcode: Faker::Address.zip_code)
      contact.phones << Phone.create(ddd: rand(99), number: number_phone)
    end
    
  end
end