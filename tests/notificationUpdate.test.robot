*** Settings ***
Library    String
Library    Browser
Library    ../utils/NotificationYaml.py
Resource    ../resources/notification_keyword.robot
Resource    ../helper/helper.robot

Test Setup    New Browser    headless=false
Test Teardown    Close Browser

*** Test Cases ***

Validate validation message is appear if title is empty
    Open Notification Detail
	Clear title field in notification form
	Click save button in form notification
    Validation message for empty title

Validate validation message is appear if title is more than 256 chars
    Open Notification Detail
    Fill title field in form notification    ${256_TEXT}
    Click save button in form notification
    Validation message for title is more than 256 chars

Validate validation message is appear if content is empty
    Open Notification Detail
    Clear content field in notification form
    Click save button in form notification
    Validation message for empty content
    
Validate validation message is appear if content is more than 256 chars
    Open Notification Detail
    Fill content field in form notification    ${256_TEXT}
    Click save button in form notification
    Validation message for content is more than 256 chars

Validate validation message is appear if notification url is empty
    Open Notification Detail
    Clear notification url field in notification form
    Click save button in form notification
    Validation message for empty notification url

Validate validation message is appear if notification url does not contain https
    Open Notification Detail
    Clear notification url field in notification form
    Fill notification url field in new notification page    ${TEXT}
    Click save button in form notification
    Validation message for notification url does not contain https

Validate coupon type is appear after select coupon in notification type field
    Open Notification Detail
    Select coupon option in notification type
    Coupon type is appear

Validate validation message is appear if coupon code is empty
    Open Notification Detail
    Select coupon option in notification type
    Click save button in form notification
    Validation message for empty coupon code

Validate back to notification page on clicking back button from notification detail page
    Open Notification Detail
    Click back button in form notification
    Verify user is on notification page

Validation Message Appears When Update Notification With Notification Type is set to Coupon and Send Option is Daily
    Open Notification Detail
    Select coupon option in notification type
    Select coupon
    Select Daily in send notification Type
    Click save button in form notification
    Validate modal message is    ${MODAL_MSG_NOTIF_TYPE_TEXT}

Validation Message Appears When Create Notification With Notification Type is set to Information and Send Option is Daily
    Open Notification Detail
    Select information option in notification type
    Select Daily in send notification Type
    Click save button in form notification
    Validate modal message is    ${MODAL_MSG_NOTIF_TYPE_TEXT}

Validation Message Appears When Create Notification With Notification Type is set to Coupon and Send Option is Once
    Open Notification Detail
    Select coupon option in notification type
    Fill notification url field in new notification page    ${URL}
    Select coupon
    Select Once in send notification Type
    Click save button in form notification
    Validate modal message is    ${MODAL_MSG_NOTIF_TYPE_TEXT}

Validation Message Appears When Create Notification With Notification Type is set to Information and Send Option is Once
    Open Notification Detail
    Select information option in notification type
    Select Once in send notification Type
    Click save button in form notification
    Validate modal message is    ${MODAL_MSG_NOTIF_TYPE_TEXT}

Validation Message Appears When Create Notification With Notification Type is set to Information and Send Now is Active
    Open Notification Detail
    Select information option in notification type
    Active send Now
    Click save button in form notification
    Validate modal message is    ${MODAL_MSG_NOTIF_TYPE_TEXT}

Validation Message Appears When Create Notification With Notification Type is set to Coupon and Send Now is Active
    Open Notification Detail
    Select coupon option in notification type
    Fill notification url field in new notification page    ${URL}
    Select coupon
	Active send Now
    Click save button in form notification
    Validate modal message is    ${MODAL_MSG_NOTIF_TYPE_TEXT}

Validate Message Appears When Creating Notification With Duplicate Title and URL
    Open Notification Detail
	Clear title field in notification form
	Fill title field in form notification    test
    Click save button in form notification
    Validate modal message is    ${MODAL_MSG_DUPLICATE_TITLE_URL_TEXT}

Validate Message Appears When Update Notification is Successful
    ${UNIQUE_VALUE}    Generate timestamp
    Open Notification Detail
    Fill title field in form notification    create_${UNIQUE_VALUE}
    Fill content field in form notification    create_${UNIQUE_VALUE}
    Select promo option in notification type
    Fill notification url field in new notification page    ${URL}
    Select None in send notification Type
    Click save button in form notification
    Validate modal message is    ${MODAL_MSG_SUCCESS_UPDATE_TEXT}
    