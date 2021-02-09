module Rest
    class Cards
        include HTTParty

        headers  'Content-Type' => 'application/jason'
        base_uri CONFIG['base_uri']

        def criar_card(token, key, idList, name)
            @key    = key
            @token  = token
            @idList = idList
            @name   = name
            self.class.post("/1/cards?token=#{@token}&key=#{@key}&idList=#{@idList}&name=#{@name}")
        end

        def editar_card(id_card, key, token, texto)
            @id    = id_card
            @key   = key
            @token = token
            @texto = texto
            self.class.post("/1/cards/#{@id}/actions/comments?key=#{@key}&token=#{@token}&text=#{@texto}")
        end

        def deletar_card(id, key, token)
            @id    = id
            @key   = key
            @token = token
            self.class.delete("https://api.trello.com/1/cards/#{@id}?key=#{@key}&token=#{@token}")
        end
    end
end