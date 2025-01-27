*** Settings ***
Library           SeleniumLibrary
Resource          resource.robot

*** Test Cases ***
UAT-Lab7-001 : Open Form
    # ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    # ${chrome_options.binary_location}     Set Variable       ${CHROME_BROWSER_PATH}
    # ${service}   Evaluate   sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    # Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Open Browser	${FORM URL}    Chrome
	Go To    ${FORM URL}    
	Location Should Be    ${FORM URL}
	Set Selenium Speed    ${DELAY}
	# Close Browser

UAT-Lab7-001 : Record Success
    Go To    ${FORM URL}   
    Input Text    firstname    ${VALID FIRSTNAME}
	Input Text    lastname    ${VALID LASTNAME}
	Input Text    destination    ${VALID DESTINATION}
	Input Text    contactperson    ${VALID CONTACT_PERSON}
	Input Text    relationship    ${VALID RELATIONSHIP}
    Input Text    email    ${VALID EMAIL}
	Input Text    phone    ${VALID PHONENUMBER}
    Click Button    submitButton
    Element Should Contain    //h1    Our agent will contact you shortly.
	Element Should Contain    //h2    Thank you for your patient.
	Location Should Contain    ${COMPLETE URL}
    Title Should Be    Completed

	[Teardown]    Close Browser

    
    