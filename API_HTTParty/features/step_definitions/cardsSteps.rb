Dado('que estou autenticado no Trello') do
    @request_autenticacao = autenticacao.get_autenticacao
    expect(@request_autenticacao.code).to eql 200
  end
  
  Quando('faço a requisição POST para o endpoint de cadastro de cards') do
    
    $token   = "a788d72ce3a3a5fec574ad497e614ace628ddadc471104c0f813ee502f13d45b"
    $key     = "da968d8a0843bce249c59d711b9ef461"
    $id      = "602117416cbabc2e011db995"
    $name    = "consegui criar"
    @request_criar_card = cards.criar_card($token, $key, $id, $name) 
  end
  
  Então('o serviço deve retornar o status code {int}') do |status_code|
    expect(@request_criar_card.code).to eql status_code
  end
  
  Então('os dados do card cadastrado') do
    expect(@request_criar_card.parsed_response['name']).to eql $name
    expect(@request_criar_card.message).to eql "OK"
    $card_id = @request_criar_card.parsed_response['id']
  end

  Quando('faço a requisição para cadastrar um card em outra coluna do board') do
    $token   = "a788d72ce3a3a5fec574ad497e614ace628ddadc471104c0f813ee502f13d45b"
    $key     = "da968d8a0843bce249c59d711b9ef461"
    $id      = "602117416cbabc2e011db994"
    $name    = "criar nova coluna1"
    @request_novo_card = cards.criar_card($token, $key, $id, $name)
  end

  Então('será retornado o status code {int}') do |status_code|
    expect(@request_novo_card.code).to eql status_code
  end

  Então('os dados do card cadastrado na outra coluna') do
    expect(@request_novo_card.parsed_response['name']).to eq $name
    expect(@request_novo_card.message).to eq "OK"
    $id_card = @request_novo_card.parsed_response['id']

  end
    
    Quando('faço a requisição para cadastrar um comentário em um card') do
      $texto   = "Editando o card"
      @request_add_comentario = cards.editar_card($id_card, $key, $token, $texto)
    end
    Então('o status code {int} dever ser retornado') do |status_code|
      expect(@request_add_comentario.code).to eql status_code
      $id_comentario = @request_add_comentario.parsed_response["id"]
      $texto_comentario = @request_add_comentario.parsed_response["data"]["text"]
    end
    Então('os dados do comentário cadastrado no card') do
      expect($texto_comentario).to eql $texto
    end

    Quando('faço a requisição para deletar os cards') do
      @request_delete_card = cards.deletar_card($card_id, $key, $token) 
      @request_delete_card = cards.deletar_card($id_card, $key, $token)
    end
    
    Então('deve ser retornado o status code {int} confimando a exclusão') do |status_code|
      expect(@request_delete_card.code).to eql status_code
    end

    