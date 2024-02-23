*** Settings ***
Documentation   boka bil
Library     SeleniumLibrary
Suite Setup     setup

*** Variables ***
${url}      http://rental22.infotiv.net/
${title}     //*[@id="title"]
${e-mail field}     //*[@id="email"]
${pass field}       //*[@id="password"]
${login}    //*[@id="login"]
${firstname}    John
${lastname}      Doe
${phonenumber}      0123456789
${usermail}     johndoe@email.boi
${pass}     abc123
${start date}      2024-02-28
${end date}        2024-02-28
${continue}        //*[@id="continue"]
${car}      //*[@id="bookModelSpass5"]
${card no.}     1234567891234567
${card day}     0
${card month}   7
${cvc}          789
${confirm}      //*[@id="confirm"]
${mypage}       //*[@id="mypage"]
${logout}       //*[@id="logout"]


*** Test Cases ***

insert incorrect personal info
    log in
    choose date
    car
    info
    confirm

creating account with incorrect personal info
    create user

car booking
    Run Keyword And Continue On Failure    User logs into website    ${usermail}    ${pass}         #DDT
    User chooses date for trip
    User books car
    User enters info
    User confirms booking


log in function
    testing log in function

log out function
    testing log out function





*** Keywords ***
setup
    Open Browser    browser=Chrome
    Go To    ${url}
    Wait Until Page Contains Element    ${title}
    Set Selenium Speed    0.5



log in

User logs into website
    [Arguments]    ${username}    ${password}                   #DDT

    [Documentation]     User enters information to log in
    [Tags]      log in
    Input Text    ${e-mail field}    ${usermail}
    Input Text    ${pass field}    ${pass}
    Click Element    ${login}
    Wait Until Page Contains Element    //*[@id="welcomePhrase"]


choose date

User chooses date for trip

    [Documentation]     User enters date for the trip
    [Tags]      date
    Click Element    //*[@id="reset"]
    Click Element    //*[@id="end"]
    Input Text    //*[@id="end"]    ${end date}
    Click Element    ${continue}


car

User books car

    [Documentation]     User chooses car
    [Tags]      Car
    Wait Until Page Contains Element    //*[@id="questionText"]
    Click Element    ${car}


info
    [Documentation]     User enters incorrect personal info
    [Tags]      info
    Wait Until Page Contains Element    //*[@id="questionText"]
    Input Text    //*[@id="cardNum"]    ${card no.}
    Input Text    //*[@id="fullName"]    21

User enters info
    [Documentation]     User enters personal info
    [Tags]      info
    Wait Until Page Contains Element    //*[@id="questionText"]
    Input Text    //*[@id="cardNum"]    ${card no.}
    Input Text    //*[@id="fullName"]    ${firstname} ${lastname}

    Select From List By Index    //*[@id="confirmSelection"]/form/select[1]     ${card day}
    Select From List By Index    //*[@id="confirmSelection"]/form/select[2]     ${card month}
    Input Text    //*[@id="cvc"]    ${cvc}
    Click Element    ${confirm}


confirm

User confirms booking

    [Documentation]     confirm booking
    [Tags]              booking
    Wait Until Page Contains Element    //*[@id="confirmMessage"]/label
    Click Element    ${mypage}
    Wait Until Page Contains Element    //*[@id="historyText"]



create user
    [Documentation]     create a new user
    [Tags]              new user
    Wait Until Page Contains Element    //*[@id="title"]
    Click Element    //*[@id="createUser"]
    Wait Until Page Contains Element    //*[@id="questionText"]
    Input Text    //*[@id="name"]    123456
    Input Text    //*[@id="last"]    123456
    Input Text    //*[@id="phone"]    00001123456789
    Input Text    //*[@id="emailCreate"]    avava@email.boi
    Input Text    //*[@id="confirmEmail"]    avava@email.boi
    Input Text    //*[@id="passwordCreate"]    abc123
    Input Text    //*[@id="confirmPassword"]    abc123
    Click Element    //*[@id="create"]
    Wait Until Page Contains Element    //*[@id="questionText"]

testing log in function
    [Documentation]     testing function log in
    [Tags]              function log in
    Wait Until Page Contains Element    ${title}
    Input Text    ${e-mail field}    ${usermail}
    Input Text    ${pass field}    ${pass}
    Click Element    ${login}
    Wait Until Page Contains Element    //*[@id="welcomePhrase"]



testing log out function
    [Documentation]     test function log out
    [Tags]              function log out
    Wait Until Page Contains Element    ${title}
    Input Text    ${e-mail field}    ${usermail}
    Input Text    ${pass field}    ${pass}
    Click Element    ${login}
    Wait Until Page Contains Element    //*[@id="welcomePhrase"]
    Click Element    ${logout}
    Wait Until Page Contains Element    //*[@id="login"]




