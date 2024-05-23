*** Settings ***
Resource  ../resources/serverest.resource


*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${mail}  statusCodeWanted=201
    Conferir se o usuário foi cadastrado corretamente

Cenário 02: Cadastrar um usuário já existente
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${mail}  statusCodeWanted=201
    Cadastro repetido de usuário
    Verificar se a API não permitiu o cadastro repetido

Cenário 03: Consultar os dados de um novo usuário
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${mail}  statusCodeWanted=201
    Consultar os dados do novo usuário
    Conferir os dados retornados

Cenário 04: Logar com o novo usuário criado
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${mail}  statusCodeWanted=201
    Realizar Login com o usuário    userEmail=${mail}    userPassword=${pass}    statusCodeWanted=200
    Conferir se o Login ocorreu com sucesso
