*** Settings ***
Library           Browser
Library    Collections
Variables    ../config/config.yaml
Variables    ../config/signin_locator.yaml

*** Variables ***
${role}    

*** Keywords ***
Open sign in page
    New Page    ${BASE_URL}

Fill email field in sign in page
    [Arguments]    ${value}
    Fill Text    ${EMAIL_FIELD}    ${value}

Fill password field in sign in page
    [Arguments]    ${value}
    Fill Text    ${PASSWORD_FIELD}    ${value}

Click sign in button in sign in page
    Click    ${SIGNIN_BUTTON}

Signin CMS
    ${EMAIL}=    Get From Dictionary   ${${role}}    EMAIL
    ${PASSWORD}=    Get From Dictionary    ${${role}}    PASSWORD
    Open sign in page
	Fill email field in sign in page    ${EMAIL}
    Fill password field in sign in page    ${PASSWORD}
    Click sign in button in sign in page