*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          0.2
# ${VALID USER}     demo
# ${VALID PASSWORD}    mode
# ${LOGIN URL}      http://${SERVER}/
# ${WELCOME URL}    http://${SERVER}/welcome.html
# ${ERROR URL}      http://${SERVER}/error.html

${FORM URL}       http://${SERVER}/Form.html
${COMPLETE URL}   http://${SERVER}/Complete.html

# ${CHROME_BROWSER_PATH}   ${CURDIR}${/}ChromeForTesting/chrome-win64/chrome.exe
# ${CHROME_DRIVER_PATH}    ${CURDIR}${/}ChromeForTesting/chromedriver-win64/chromedriver.exe

${CHROME_BROWSER_PATH}   ${CURDIR}/../ChromeForTesting/chrome/win64-132.0.6834.110/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}    ${CURDIR}/../ChromeForTesting/chromedriver/win64-132.0.6834.110/chromedriver-win64/chromedriver.exe

${VALID FIRSTNAME}    Somsong
${VALID LASTNAME}    Sandee
${VALID DESTINATION}    Europe
${VALID CONTACT_PERSON}    Sodsai Sandee
${VALID RELATIONSHIP}    Mother
${VALID EMAIL}    somsong@kkumail.com
${INVALID EMAIL}    somsong@
${VALID PHONENUMBER}    081-111-1234
${INVALID PHONENUMBER}    191
${DESTINATION ERROR MESSAGE}    Please enter your destination.
${EMAIL ERROR MESSAGE}    Please enter a valid email address.
${EMPTY PHONENUMBER ERROR MESSAGE}    Please enter a phone number.
${INVALID PHONENUMBER ERROR MESSAGE}    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)


*** Keywords ***

Start Chrome For Testing
    # [Documentation]    Launch Chrome browser using specified paths and navigate to the URL.
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}           Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}

Open Browser To Form Page
    Go To    ${FORM URL}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Go To Form Page
    Go To    ${FORM URL}
    Title Should Be   Customer Inquiry

Input FirstName
    [Arguments]    ${FirstName}
    Wait Until Element Is Visible    id=firstname    timeout=10
    Input Text    id=firstname    ${FirstName}
    
Input LastName
    [Arguments]    ${LastName}
    Wait Until Element Is Visible    id=lastname    timeout=10
    Input Text    id=lastname    ${LastName}

Input Destination
    [Arguments]    ${destination}
    Wait Until Element Is Visible    id=destination    timeout=10
    Input Text    id=destination    ${destination}

Input Contact
    [Arguments]    ${contact}
    Wait Until Element Is Visible    id=contactperson    timeout=10
    Input Text    id=contactperson    ${contact}

Input Relationship
    [Arguments]    ${relationship}
    Wait Until Element Is Visible    id=relationship    timeout=10
    Input Text    id=relationship    ${relationship}

Input Email
    [Arguments]    ${email}
    Wait Until Element Is Visible    id=email    timeout=10
    Input Text    id=email    ${email}

Input PhoneNo
    [Arguments]    ${phoneno}
    Wait Until Element Is Visible    id=phone    timeout=10
    Input Text    id=phone    ${phoneno}

Submit Form
    Wait Until Element Is Visible    id=submitButton    timeout=10
    Click Button    submitButton

