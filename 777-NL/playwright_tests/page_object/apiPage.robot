*** Settings ***
Library    ../resources/keywords.py

*** Variables ***
${BASE_URL}    https://petstore.swagger.io/v2

*** Keywords ***


Create new API Session
    [Arguments]    ${base_url}
    Create API Session    ${base_url}

GET Request
    [Arguments]    ${endpoint}
    ${response}=    Perform GET Request    ${endpoint}
    Log to console    The status of the request: ${response.status_code}
    Log to console    The content of the request: ${response.content}
    RETURN    ${response}

POST Request
    [Arguments]    ${endpoint}    ${data}
    ${response}=    Perform POST Request    ${endpoint}    ${data}
    Log to console    The status of the request: ${response.status_code}
    Log to console    The content of the request: ${response.content}
    RETURN    ${response}

PUT Request
    [Arguments]    ${endpoint}    ${data}
    ${response}=    Perform PUT Request    ${endpoint}    ${data}
    Log to console    The status of the request: ${response.status_code}
    Log to console    The content of the request: ${response.content}
    RETURN    ${response}

DELETE Request
    [Arguments]    ${endpoint}
    ${response}=    Perform DELETE Request    ${endpoint}
    Log to console    The status of the request: ${response.status_code}
    Log to console    The content of the request: ${response.content}
    RETURN    ${response}
