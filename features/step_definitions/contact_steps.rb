# encoding: utf-8

Dado /^estou na página de novo contato$/ do
  visit new_contact_path
end

Dado /^preencho o formulário com os dados válido$/ do
  fill_in 'Name', with: 'Mark'
  fill_in 'Email', with: 'mark@example.com'
  fill_in 'Address', with: 'Rua: Santos Dumont'
  fill_in 'Number', with: '456'
  fill_in 'Zipcode', with: '16200123'
end

Quando /^clico em "(.*?)"$/ do |text|
  click_button text
end

Então /^devo ver a mensagem "(.*?)"$/ do |message|
  page.should have_content(message)
end