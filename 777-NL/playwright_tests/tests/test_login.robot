*** Settings ***
Resource   ../resources/commons.robot
Resource   ../page_object/loginPage.robot

Test Teardown    Run keywords   Capture final Screenshot   AND   Close Playwright Browser
Test Setup     Run keywords   Open Playwright Browser
*** Variables ***
${USERNAME}       test_9qf3ekw7
${PASSWORD}       Sjgimo@777

*** Test Cases ***
Login to Casino
    [Documentation]    Test case to log in to the example site using POM with improved reliability.
    Open Login Page
    Wait For Page to Load
    Click Login Buttonn
    Input Username    ${USERNAME}
    #Wait For Element to be Visible    id="password"
    Input Password    ${PASSWORD}
    #Wait For Element to be Enabled    input[name="login-button"]  ## only works if element has the attribute enable/disable
    Click Login Button
    Wait For Page to Load
