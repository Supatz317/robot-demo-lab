*** Settings ***
Library           SeleniumLibrary
Resource          resource.robot

*** Variables ***

${URL}                    https://www.kku.ac.th

*** Keywords ***
Start Chrome For Testing
    [Arguments]    ${URL}
    [Documentation]    Launch Chrome browser using specified paths and navigate to the URL.
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}           Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${URL}
    # [Teardown]    Close Browser

*** Test Cases ***
TC_001: Start Chrome For Testing
    Start Chrome For Testing   ${URL}
    
    [Teardown]    Close Browser