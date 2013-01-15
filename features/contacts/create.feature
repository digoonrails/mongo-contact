# language: pt
Funcionalidade: Create Contact
  Para registrar os contatos
  Como um usuário comum
  Eu quero registrar meus dados para contato
  
  Cenário: Registrar dados de contato válido
    Dado estou na página de novo contato
    E preencho o formulário com os dados válido
    Quando clico em "Create Contact"
    Então devo ver a mensagem "Contato cadastrado com sucesso."