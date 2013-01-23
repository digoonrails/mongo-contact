# encoding: utf-8

Dado /^estou na página de novo contato$/ do
  visit new_contact_path
end

Dado /^preencho o formulário com os dados válido$/ do
  select('Pessoal', :from => 'Kind')
  fill_in 'Name', with: 'Rodrigo'
  fill_in 'Email', with: 'rodrigo.pest@gmail.com'
  within(:css, '#addresses') do
    fill_in 'Address', with: 'Rua: XYZ'
    fill_in 'Number', with: '4569'
    fill_in 'Zipcode', with: '16200123'
  end
  within(:css, '#phones') do
    fill_in 'DDD', with: '18'
    fill_in 'Number', with: '9787-1198'
  end
end

Dado /^os seguintes registros existem:$/ do |table|
  table.hashes.each do |hash|
    contact = Contact.create(name: hash["name"], email: hash["email"], kind: hash["kind"])

    contact.addresses << Address.new(address: hash["A1"], number: hash["a1_n"], zipcode: hash["a1_zip"])
    contact.addresses << Address.new(address: hash["A2"], number: hash["a2_n"], zipcode: hash["a2_zip"])
    
    contact.phones << Phone.new(ddd: hash["phone1_ddd"], number: hash["phone1_n"])
    contact.phones << Phone.new(ddd: hash["phone2_ddd"], number: hash["phone2_n"])
  end
end

Dado /^estou na pagina inicial de contatos$/ do
  visit contacts_path
end

Quando /^clico em "(.*?)"$/ do |text|
  click_button text
end

Quando /^clico no link "(.*?)"$/ do |text|
  click_link text
end

Então /^devo ver apenas "(\d+)" registros$/ do |number|
  page.should have_css('tr.records', count: number.to_i)
end

Então /^a minha lista de contatos deve conter "(.*?)"$/ do |list|
  actual_order = page.all('.name').collect(&:text)
  actual_order.should == list.split(', ')
end

Então /^devo ver a mensagem "(.*?)"$/ do |message|
  page.should have_content(message)
end

Então /^devo ver "(.*?)"$/ do |text|
  page.should have_content(text)
end