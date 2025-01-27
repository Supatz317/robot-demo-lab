*** Settings ***
Library           SeleniumLibrary
Resource          resource.robot

*** Variables ***

${COMPLETE URL}   http://${SERVER}/Complete.html
${FIRSTNAME}      Somsong
${LASTNAME}       Sandee
${DESTINATION}    Europe
${CONTACT}        Sodsai Sandee
${RELATIONSHIP}   Mother
${EMAIL}          somsong@kkumail.com
${PhoneNo}        081-111-1234



*** Test Cases ***        
Open Form
#     ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
#     ${chrome_options.binary_location}     Set Variable       ${CHROME_BROWSER_PATH}
#     ${service}   Evaluate   sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
#     Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    
    Open Browser	${FORM URL}    Chrome
    Go To    ${FORM URL}
	Location Should Be    ${FORM URL}
    Set Selenium Speed    ${DELAY}

UAT-Lab7-002 : Empty Destination 
    # Start Chrome For Testing    
    Go To    ${FORM URL}
    Input Text    firstname    ${VALID FIRSTNAME}
	Input Text    lastname    ${VALID LASTNAME}
	Input Text    destination    ${EMPTY}
	Input Text    contactperson    ${VALID CONTACT_PERSON}
	Input Text    relationship    ${VALID RELATIONSHIP}
    Input Text    email    ${VALID EMAIL}
	Input Text    phone    ${VALID PHONENUMBER}
    Click Button    submitButton
    Title Should Be     Customer Inquiry
    Element Should Contain    id=errors    ${DESTINATION ERROR MESSAGE}
     
UAT-Lab7-002 : Empty Email      
    Go To    ${FORM URL}
    Location Should Be    ${FORM URL}
    Input Text    firstname    ${VALID FIRSTNAME}
	Input Text    lastname    ${VALID LASTNAME}
	Input Text    destination    ${VALID DESTINATION}
	Input Text    contactperson    ${VALID CONTACT_PERSON}
	Input Text    relationship    ${VALID RELATIONSHIP}
    Input Text    email    ${EMPTY}
	Input Text    phone    ${VALID PHONENUMBER}
    Click Button    submitButton
    Title Should Be     Customer Inquiry
    Element Should Contain    id=errors    ${EMAIL ERROR MESSAGE}

Invalid Email
    Go To    ${FORM URL}
    Location Should Be    ${FORM URL}
    Input Text    firstname    ${VALID FIRSTNAME}
	Input Text    lastname    ${VALID LASTNAME}
	Input Text    destination    ${VALID DESTINATION}
	Input Text    contactperson    ${VALID CONTACT_PERSON}
	Input Text    relationship    ${VALID RELATIONSHIP}
    Input Text    email    ${INVALID EMAIL}
	Input Text    phone    ${VALID PHONENUMBER}
    Click Button    submitButton
    Title Should Be     Customer Inquiry
    Element Should Contain    id=errors    ${EMAIL ERROR MESSAGE}

Empty Phone Number
    Go To    ${FORM URL}
    Location Should Be    ${FORM URL}
    Input Text    firstname    ${VALID FIRSTNAME}
	Input Text    lastname    ${VALID LASTNAME}
	Input Text    destination    ${VALID DESTINATION}
	Input Text    contactperson    ${VALID CONTACT_PERSON}
	Input Text    relationship    ${VALID RELATIONSHIP}
    Input Text    email    ${VALID EMAIL}
	Input Text    phone    ${EMPTY}
    Click Button    submitButton
    Title Should Be     Customer Inquiry
    Element Should Contain    id=errors    ${EMPTY PHONENUMBER ERROR MESSAGE}


Invalid Phone Number
    Go To    ${FORM URL}
    Location Should Be    ${FORM URL}
    Input Text    firstname    ${VALID FIRSTNAME}
	Input Text    lastname    ${VALID LASTNAME}
	Input Text    destination    ${VALID DESTINATION}
    Input Text    contactperson    ${VALID CONTACT_PERSON}
	Input Text    relationship    ${VALID RELATIONSHIP}
    Input Text    email    ${VALID EMAIL}
    Input Text    phone    ${INVALID PHONENUMBER}
    Click Button    submitButton
    Title Should Be      Customer Inquiry
    Element Should Contain    id=errors    ${INVALID PHONENUMBER ERROR MESSAGE}
    [Teardown]    Close Browser