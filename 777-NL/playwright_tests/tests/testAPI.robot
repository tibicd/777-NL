*** Settings ***
Library    ../resources/keywords.py
Library    Collections

*** Variables ***
${BASE_URL}        https://petstore.swagger.io/v2
${USERNAME}        testuser
${USER_ID}         0
${FIRST_NAME}      Test
${LAST_NAME}       User
${EMAIL}           testuser@example.com
${PASSWORD}        password
${PHONE}           1234567890

*** Test Cases ***
Perform POST Request
    [Documentation]    Perform a POST request to add a new user.
    Create API Session    ${BASE_URL}
    ${data}=    Create Dictionary    id=${USER_ID}    username=${USERNAME}    firstName=${FIRST_NAME}
    ${response}=    Perform Post Request    /user    ${data}
    Should Be Equal As Numbers    ${response.status_code}    200

Perform GET Request
    [Documentation]    Perform a GET request to fetch user details.
    Create API Session    ${BASE_URL}
    ${response}=    Perform Get Request    /user/${USERNAME}
    Should Be Equal As Numbers    ${response.status_code}    200

Perform PUT Request
    [Documentation]    Perform a PUT request to update user details.
    Create API Session    ${BASE_URL}
    ${data}=    Create Dictionary    id=${USER_ID}    username=${USERNAME}
    ${response}=    Perform Put Request    /user/${USERNAME}    ${data}
    Should Be Equal As Numbers    ${response.status_code}    200

Perform DELETE Request
    [Documentation]    Perform a DELETE request to remove the user.
    Create API Session    ${BASE_URL}
    ${response}=    Perform Delete Request    /user/${USERNAME}
    Should Be Equal As Numbers    ${response.status_code}    200
