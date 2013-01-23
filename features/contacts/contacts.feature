# language: pt
Funcionalidade: Contatos
  Para listar os dados dos contatos
  Como um usuário comum
  Eu quero visualizar os contatos cadastrados
  
  Contexto:
    Dado os seguintes registros existem:
      | name  | email            | kind | A1 | a1_n | a1_zip    | A2  | a2_n | a2_zip    | phone1_ddd | phone1_n  | phone2_ddd | phone2_n  |
      | John  | john@example.com | 0    | A  | 1    | 16123-567 | A-1 | 4    | 17123-567 | 18         | 9787-1122 |            |           |
      | Jimmy | jimmy@gmail.com  | 1    | B  | 2    | 16123-568 |     |      |           | 19         | 3641-4067 |            |           |
      | Susan | susan@gmail.com  | 0    | C  | 3    | 16123-563 | C-3 | 6    | 17123-563 | 11         | 9787-1189 | 11         | 3211-3040 |
    E estou na pagina inicial de contatos
  

  Esquema do Cenário: Visualizar os contatos cadastrados
    Então devo ver "<contact>"
    E devo ver "<email>"
    E devo ver "<kind>"
    E devo ver "<phone1>"
    E devo ver "<phone2>"
    
    Exemplos:
      | contact | email            | kind        | phone1         | phone2         |
      | John    | john@example.com | Pessoal     | (18) 9787-1122 |                |
      | Jimmy   | jimmy@gmail.com  | Empresarial | (19) 3641-4067 |                |
      | Susan   | susan@gmail.com  | Pessoal     | (11) 9787-1189 | (11) 3211-3040 |
      
  Esquema do Cenário: Filtrar os contatos por tipo
    Quando clico no link "<link>"
    Então devo ver apenas "<total>" registros
    E a minha lista de contatos deve conter "<list>"
      
    Exemplos:
      | link        | total | list               |
      | Pessoal     | 2     | John, Susan        |
      | Empresarial | 1     | Jimmy              |
      | Ambos       | 3     | John, Jimmy, Susan |
