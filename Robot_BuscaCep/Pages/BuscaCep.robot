*** Settings ***
Resource                ../resource.robot

*** Variable ***
${CEP_URL}             https://buscacepinter.correios.com.br/app/endereco/index.php
${RASTREAMENTO_URL}    https://www.correios.com.br/

*** Keywords ***
#PRE-CONDIÇÕES

Dado que esteja acessando o busca cep dos correios
        Go To                                           ${CEP_URL}

Dado que esteja acessando o rastreamento dos correios
        Go To                                           ${RASTREAMENTO_URL}

#Ações
Quando preencher o cep especifico "${mensagem}"
        Input Text                                   xpath=//*[@id="endereco"]                     ${mensagem}
        Select From List By Label                    xpath=//*[@id="tipoCEP"]                      Localidade/Logradouro

Quando procurar no rastreamento de código o número "${codRastreamento}"

         Wait Until Element Is Visible          //*[@id="rodape-content"]/div[1]
         Wait Until Element Is Visible              //*[@id="visual-portal-wrapper"]
         Wait Until Element Is Visible              //*[@id="cookiesId"]/div
         Wait Until Element Is Visible              //*[@id="cookiesId"]
         Click Element                              //*[@id="btnCookie"]
         Sleep    1s
         Input Text                                 //*[@id="objetos"]                             ${codRastreamento}
         Wait Until Element Is Visible             //*[@id="content"]/div[3]/div/div[2]/div[1]/form/div[2]
         Click Button                               //*[@id="content"]/div[3]/div/div[2]/div[1]/form/div[2]/button

Entao deve ser confirmado que o CEP não existe e voltar para tela inicial
         Click Element                                xpath=//*[@id="btn_pesquisar"]
         Capture Page Screenshot
         Click Button                                 id:btn_nbusca

Entao deve ser confirmado que o endereço seja "${rua}" e "${cidade_estado}"
        Click Element                                //*[@id="btn_pesquisar"]
        Wait Until Element Is Visible                //*[@id="resultado"]/div[4]
        Page Should Contain                          ${rua}
        Page Should Contain                          ${cidade_estado}
        Capture Page Screenshot
        Click Button                                 id:btn_nbusca

Entao deve ser confirmado que o código não está correto
        Capture Page Screenshot
        Close Browser