*** Settings ***
Resource                ../resource.robot
Resource                ../Pages/BuscaCep.robot
Test Setup              Abrir navegador
#Test Teardown           Fechar navegador


*** Test Case ***
Cenario 01: Acessar o busca cep dos correios e inserir um cep especifico que não existe
        Dado que esteja acessando o busca cep dos correios
        Quando preencher o cep especifico "80700000"
        Entao deve ser confirmado que o CEP não existe e voltar para tela inicial

Cenario 02: Acessar o busca cep dos correios e inserir um cep especifico para confirmar o endereço
        Dado que esteja acessando o busca cep dos correios
        Quando preencher o cep especifico "01013-001"
        Entao deve ser confirmado que o endereço seja "Rua Quinze de Novembro" e "São Paulo/SP"

Cenario 03: Procurar codigo de rastreamento
        Dado que esteja acessando o rastreamento dos correios
        Quando procurar no rastreamento de código o número "SS987654321BR"
        Entao deve ser confirmado que o código não está correto


