*** Settings ***
Library    String
Library    ../utils/NotificationYaml.py
Resource    ../resources/notification_keyword.robot

Test Setup    New Browser    headless=false
Test Teardown    Close Browser

*** Test Cases ***
Search Notification With Valid Input Should Show Matching Data
    ${TITLE}=    Get Notification Title From yaml
	Open Notification Page
	Fill keyword in title filter field    ${TITLE}
	Successful Search Displays Results In Table