*** Settings ***
Library    keywords.py
Library    DateTime

*** Keywords ***
Open Playwright Browser
    [Documentation]    Opens a new browser instance.
    Open Browser

Close Playwright Browser
    [Documentation]    Closes the browser instance.
    Close Browser

Navigate To
    [Arguments]    ${url}
    [Documentation]    Navigates to the given URL.
    Navigate    ${url}

Type Input
    [Arguments]    ${selector}    ${value}
    [Documentation]    Fills the input identified by the selector with the given value.
    Fill Input    ${selector}    ${value}

Click Button
    [Arguments]    ${selector}
    [Documentation]    Clicks the element identified by the selector.
    Click Element    ${selector}

Wait For Element
    [Arguments]    ${selector}
    [Documentation]    Waits for the element identified by the selector to be present.
    Wait For Selector    ${selector}


Wait For Element to be Visible
    [Arguments]    ${selector}
    [Documentation]    Waits for the element identified by the selector to be visible.
    Wait For Element Visible    ${selector}

Wait For Element to be Enabled
    [Arguments]    ${selector}
    [Documentation]    Waits for the element identified by the selector to be enabled.
    Wait For Element Enabled    ${selector}

Wait For Page to Load
    [Documentation]    Waits for the page to load completely.
    Wait For Page Load

Wait Until Element Contains the Text
    [Arguments]    ${selector}    ${text}
    [Documentation]    Waits until the element identified by the selector contains the given text.
    Wait Until Element Contains Text    ${selector}    ${text}

Set Timeout
    [Arguments]    ${timeout}
    [Documentation]    Sets the default timeout for page operations.
    Set Timeout    ${timeout}

Handle Alert
    [Documentation]    Handles any alert that appears on the page.
    Handle Alert

Check the Element Existence
    [Arguments]    ${selector}
    [Documentation]    Checks if the element identified by the selector exists.
    Check Element Existence    ${selector}

Assert the Element Text
    [Arguments]    ${selector}    ${expected_text}
    [Documentation]    Asserts that the element identified by the selector has the expected text.
    Assert Element Text    ${selector}    ${expected_text}

Capture final Screenshot
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${ss_name}=  Set variable  ${TEST_NAME}_${timestamp}
    Run keyword if test failed    Log Screenshot Warn Message    ${ss_name}
    Run keyword if test failed    Capture Screenshot  ${ss_name}.jpg

Retry the Keyword
    [Arguments]    ${keyword}    ${attempts}
    [Documentation]    Retries the given keyword a specified number of times.
    FOR    ${index}    IN RANGE    ${attempts}
           Log to Console  this is the ${index} try
           ${result} =    Run Keyword And Ignore Error    ${keyword}
           Run Keyword If    '${result[0]}' == 'PASS'    Exit For Loop
    END
    Run Keyword If    '${result[0]}' == 'FAIL'    Fail    ${result[1]

Wait For the Network Idle
    [Arguments]    ${idle_time}
    [Documentation]    Waits until there are no network requests for the specified duration.
    Wait For Network Idle    ${idle_time}

New Browser Context
    [Documentation]    Creates a new browser context.
    New Browser Context

Get matching Elements Text
    [Arguments]    ${selector}
    [Documentation]    Returns a list of text content for all elements matching the selector.
    @{elements}=    Get All Elements Text    ${selector}
    RETURN    @{elements}

Click on All Add To Cart Buttons
    [Arguments]    ${selector}
    [Documentation]    Clicks all elements matching the selector and returns the count of clicks.
    ${count}=    Click All Add To Cart Buttons    ${selector}
    RETURN    ${count}

Get the Shopping Cart Badge Text
    [Arguments]    ${selector}
    [Documentation]    Gets the text content of the shopping cart badge.
    ${text}=    Get Shopping Cart Badge Text    ${selector}
    RETURN    ${text}