#language: pt 

@autenticacao  @all
Funcionalidade: Autenticação
    Eu como usuário do Trello
    Quero realizar minha autenticação 
    Para que eu possa utilizar suas APIs

   Contexto: Logar no Trello
    Dado que estou logado no Trello

    Cenario: Autenticar com dados válidos     
      E informei minha chave de acesso
      Quando faço a requisição GET para endpoint de autenticação informando meu token
      Entao o serviço retorna o status code  200
      E a mensagem OK

    Cenario: Autenticar com chave inválida
      E informei uma chave inválida 
      Quando faço a requisição com um token válido
      Então o serviço retorna o staus code 401
      E a mensagem informando que a chave é  Unauthorized


    Cenario: Autenticar com token inválido
      E informei uma chave válida
      Quando faço a requisição com um token inválido
      Então o serviço retorna o staus code 401
      E a mensagem informando que a chave é  Unauthorized

    Cenario: Autenticar com dados inválidos
      Quando faço a requisição com dados inválidos
      Então o serviço retorna o staus code 401
      E a mensagem informando que a chave é  Unauthorized