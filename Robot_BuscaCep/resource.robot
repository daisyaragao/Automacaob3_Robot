*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${BROWSER}              chrome


*** Keywords ***
Abrir navegador
        #DESABILITA O LOGGING
        ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
        Call Method    ${chrome_options}    add_argument    --disable-extensions
#        Call Method    ${chrome_options}    add_argument    --headless
        Call Method    ${chrome_options}    add_argument    --disable-gpu
        Call Method    ${chrome_options}    add_argument    --no-sandbox
        Call Method    ${chrome_options}    add_argument    --disable-logging
        Call Method    ${chrome_options}    add_argument    --incognito
        ${EXCLUDES}    Create list     enable-logging
        Call Method    ${chrome_options}    add_experimental_option    excludeSwitches  ${EXCLUDES}
        Create Webdriver    Chrome    chrome_options=${chrome_options}
        Set Window Size    1920    1080

Fechar navegador
        Close Browser