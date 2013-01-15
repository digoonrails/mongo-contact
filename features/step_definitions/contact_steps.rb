# encoding: utf-8

Dado /^estou na página de novo contato$/ do
  visit new_contact_path
end

Dado /^preencho o formulário com os dados válido$/ do
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

Quando /^clico em "(.*?)"$/ do |text|
  click_button text
end

Então /^devo ver a mensagem "(.*?)"$/ do |message|
  page.should have_content(message)
end