#language: pt

@cadastro @all
Funcionalidade: Criar um card no board do Trello
 
    Como usuário do Trello
    Quero criar um novo card utilizando o endpoint de cadastro de cards
    Para cadastrar uma nova tarefa
 
    Contexto: Logar no Trello
        Dado que estou autenticado no Trello

    Cenario: Cadastrar novo card        
        Quando faço a requisição POST para o endpoint de cadastro de cards
        Então o serviço deve retornar o status code 200
        E os dados do card cadastrado

    Cenario: Cadastrar um card em uma coluna diferente
        Quando faço a requisição para cadastrar um card em outra coluna do board
        Então será retornado o status code 200
        E os dados do card cadastrado na outra coluna
    
    Cenario: Adicionar um comentário em um card cadastrado
        Quando faço a requisição para cadastrar um comentário em um card
        Então o status code 200 dever ser retornado
        E os dados do comentário cadastrado no card

    Cenario: Deletar card cadastrado
        Quando faço a requisição para deletar os cards
        Então deve ser retornado o status code 200 confimando a exclusão
