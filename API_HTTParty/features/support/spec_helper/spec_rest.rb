module REST
    def autenticacao
        Rest::Autenticacao.new
    end

    def cards
        Rest::Cards.new
    end
end