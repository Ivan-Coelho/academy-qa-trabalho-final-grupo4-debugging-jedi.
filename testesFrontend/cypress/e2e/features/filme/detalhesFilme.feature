# language: pt


Funcionalidade: Consulta de detalhes de filmes 

@cadastroFilme @deletar
Cenário: usuário não logado deve conseguir acessar os detalhes dos filmes registrados no catálogo
Dado que usuario não cadastrado acessa o site 
Quando acessa a página de detalhes de um filme
Então usuário conseguirá ver a página de detalhes do filme

# Cenário: usuário logado pode consultar os detalhes dos filmes registrados no catálogo
# Dado que usuário "logado" acessa o site
# Quando acessa a página de detalhes de um filme
# Então usuário conseguirá ver os detalhes do filme

# Cenário: Deve ser possível consultar um filme facilmente através do id do filme
# Dado que usuário"não cadastrado" acessa o site
# Quando informa o id de um filme
# Então usuário conseguirá ver os detalhes do filme

# Cenário: Consultar um filme utilizando um ID de filme inexistente não deve retornar nenhum filme
# Dado que usuário"não cadastrado" acessa o site
# Quando informa o id de um filme "99999"
# Então não encontrará nenhum filme

# Cenário: Consultar um filme utilizando um ID de filme inexistente não deve retornar nenhum filme e as funcionalidades da página devem estar desabilitadas
# Dado que usuário"não cadastrado" acessa o site
# Quando informa o id de um filme
# Então o sistema retornará uma página com as funcionalidades desabilitadas
# E o usuário não conseguirá interagir com as funcionalidades

# Cenário: A página de detalhes do filme deve conter todas as informações relevantes sobre o filme (Título, descrição, gênero, ano de lançamento, duração, além da imagem)
# Dado que usuário "não cadastrado" acessa o site
# Quando acessa a página de detalhes de um filme
# Então o usuário conseguirá visualizar todas as informações do filme

# Cenário:A página de detalhes do filme deve conter um totalizador das avaliações de audiência
# Dado que usuário "não cadastrado" acessa o site
# Quando acessa a página de detalhes de um filme
# Então o usuário conseguirá visualizar um totalizador das avaliações de audiência

# Cenário:A página de detalhes do filme deve conter um totalizador das avaliações de críticos
# Dado que usuário "não cadastrado" acessa o site
# Quando acessa a página de detalhes de um filme
# Então o usuário conseguirá visualizar um totalizador das avaliações de críticos

# // analisar se é possivel aproveitar o step "Então"
# Cenário: A página de detalhes do filme deve conter um totalizador das avaliações de audiência que será a média das avalizações dos usuários não críticos
# Dado que usuário "não cadastrado" acessa o site
# Quando acessa a página de detalhes de um filme
# Então o usuário conseguirá visualizar um totalizador das avaliações de audiência

# Cenário:A página de detalhes do filme deve conter um totalizador das avaliações de críticos que será a média das avalizações dos usuários críticos
# Dado que usuário "não cadastrado" acessa o site
# Quando acessa a página de detalhes de um filme
# Então o usuário conseguirá visualizar um totalizador das avaliações de críticos

# Cenário:A página de detalhes do filme deve conter a opção para avaliar o filme se for acessada por um usuário logado
# Dado que usuário "logado" acessa o site
# Quando acessa a página de detalhes de um filme
# Então será possível criar uma avaliação para o filme 

# // acho que vai ser o mesmo teste do primeiro da funcionalidade avaliação de filme
# Cenário:A página de detalhes do filme deve conter a opção para fazer login se for acessada por um usuário não logado 
# Dado que usuário "não cadastrado" acessa o site
# Quando acessa a página de detalhes de um filme
# E tentar criar uma avaliação para o filme
# Então o sistema retornará a opção para realizar o login

# Cenário: A página de detalhes do filme deve conter todas as avaliações registradas para o filme
# Dado que usuário "não cadastrado" acessa o site
# Quando acessa a página de detalhes de um filme
# Então o usuário conseguirá visualizar todas as avaliações registradas para o filme

# Cenário: A página de detalhes do filme deve conter todas as avaliações registradas para o filme
# Dado que usuário "não cadastrado" acessa o site
# Quando acessa a página de detalhes de um filme
# Então o usuário conseguirá visualizar todas as avaliações registradas para o filme

# Cenário: As avaliações registradas para o filme devem conter as informações relevantes (data da avaliação (opcionalmente exibir a hora/minuto), nome do usuário que escreveu a avaliação, nota e texto da avaliação)

# Dado que usuário "não cadastrado" acessa o site
# Quando acessa a página de detalhes de um filme
# Então o usuário conseguirá visualizar todas as informações relevantes das avaliações do filme