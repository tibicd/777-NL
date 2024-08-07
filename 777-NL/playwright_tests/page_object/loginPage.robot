*** Settings ***
Resource    ../resources/commons.robot

*** Variables ***
${URL}            https://www.casino777.nl/en/

*** Keywords ***
Open Login Page
    Navigate To    ${URL}

Input Username
    [Arguments]    ${username}
    Type Input    //*[@id="username"]    ${username}

Input Password
    [Arguments]    ${password}
    Type Input    //*[@id="password"]    ${password}

Login
    [Arguments]    ${username}   ${password}
    Type Input    //*[@id="username"    ${username}
    Type Input    //*[@id="password"    ${password}
    Click Button   //*[@id="submit-login"]

Click Login Button
    Click Button    //*[@id="submit-login"]

Click Login Buttonn
    Click Button    //*[@id="header_guest"]/div[3]/button
Wait For the Welcome Message
    Wait For Element    id=add-to-cart-sauce-labs-backpack

Print All Item Names
    [Documentation]    Iterates through all items on the page and prints their names.
    @{item_names}=    Get matching Elements Text    .inventory_item_name
    FOR    ${item_name}    IN    @{item_names}
           Log to console    ${item_name}
           Sleep  1
    END

Add All Items To Cart And Verify
    [Documentation]    Clicks all add-to-cart buttons and verifies the shopping cart badge count.
    ${click_count}=    Click on All Add To Cart Buttons    .btn_inventory
    ${cart_badge_text}=    Get the Shopping Cart Badge Text    .shopping_cart_badge
    Should Be Equal As Numbers    ${cart_badge_text}    6
