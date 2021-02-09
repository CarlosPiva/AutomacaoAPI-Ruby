Dado('que estou logado no Trello') do
  @request_autenticacao = autenticacao.get_autenticacao
  expect(@request_autenticacao.code).to eql 200
end 

Dado('informei minha chave de acesso') do
  $chave_valida = "da968d8a0843bce249c59d711b9ef461"
end

Quando('faço a requisição GET para endpoint de autenticação informando meu token') do
  $token = "a788d72ce3a3a5fec574ad497e614ace628ddadc471104c0f813ee502f13d45b"
  
  @request_token = autenticacao.get_autorizacao($chave_valida, $token)
end

Entao('o serviço retorna o status code  {int}') do |status_code|
  expect(@request_token.code).to eql status_code
end

Entao('a mensagem OK') do
 expect(@request_token.message).to eql "OK"
end

Dado('informei uma chave inválida') do
  $chave_invalida = "da968d8a0843bce249c59d711b9ef463"
end

Quando('faço a requisição com um token válido') do
  $token = "a788d72ce3a3a5fec574ad497e614ace628ddadc471104c0f813ee502f13d45b"  
  @request_token = autenticacao.get_autorizacao($chave_invalida, $token)
end

Então('o serviço retorna o staus code {int}') do |status_code|
  expect(@request_token.code).to eql status_code
end

Então('a mensagem informando que a chave é  Unauthorized') do
  expect(@request_token.message).to eq "Unauthorized"
end

Dado('informei uma chave válida') do
  $chave_valida
end

Quando('faço a requisição com um token inválido') do
  $token_invalido = "pi88d72ce3a3a5fec574ad497e614ace628ddadc471104c0f813ee502f13d45b"  
  @request_token = autenticacao.get_autorizacao($chave_valida, $token_invalido)
end

Quando('faço a requisição com dados inválidos') do
  @request_token = autenticacao.get_autorizacao($chave_invalida, $token_invalido)
end