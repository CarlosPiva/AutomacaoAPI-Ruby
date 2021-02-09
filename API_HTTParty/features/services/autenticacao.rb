module Rest
    class Autenticacao
        include HTTParty 

        headers 'Content-Type' => 'application/jason'
        base_uri CONFIG['base_uri']

        def get_autenticacao
            self.class.get('/1/types/piva29')
        end

        def get_autorizacao(key, token)
            @key   = key
            @token = token
            self.class.get("/1/members/me/boards?key=#{@key}&token=#{@token}")
        end
    end
end