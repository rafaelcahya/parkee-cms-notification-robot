*** Settings ***
Library    Browser
Library    OperatingSystem
Library    Collections
Library    ../utils/NotificationYaml.py
Variables    ../config/config.yaml
Variables    ../config/menu_locator.yaml
Variables    ../config/notification_locator.yaml
Resource    signin_keyword.robot

*** Keywords ***
Click Notification Menu from sidebar
    Click    ${NOTIFICATION_MENU}
	Wait For Navigation    ${BASE_URL}${ENDPOINT_NOTIFICATION_URL}

Open Notification Page
    Signin CMS
    Click Notification Menu from sidebar

Verify user is on notification Page
    ${CURRENT_URL}=    Get Url
	Should Contain    ${CURRENT_URL}    ${BASE_URL}${ENDPOINT_NOTIFICATION_URL}

Fill keyword in title filter field
    [Arguments]    ${VALUE}
    Fill Text    ${TITLE_FILTER_FIELD}    ${VALUE}

Successful Search Displays Results In Table
    ${SEARCH_VALUE}    Get Text    ${TITLE_FILTER_FIELD}
    ${RESULT}    Get Text    ${TITLE_NOTIFICATION_TABLE}
    Should Be Equal    ${SEARCH_VALUE}    ${RESULT}

Click data from Table
    Click    ${TITLE_NOTIFICATION_TABLE}

Open Notification Detail
    ${TITLE}=    Get Notification Title From Yaml
    Open Notification Page
	Fill keyword in title filter field    ${TITLE}
	Click data from Table

Open create notification page
    Signin CMS
    Click Notification Menu from sidebar
    Click new notification button

Click new notification button
    Click    ${NEW_NOTIFICATION_BUTTON}
    Wait For Navigation    ${BASE_URL}${ENDPOINT_NOTIFICATION_URL}${ENDPOINT_CREATE_NOTIFICATION_URL}

Verify user is on create notification page
    ${CURRENT_URL}=    Get Url
    Should Contain    ${CURRENT_URL}    ${BASE_URL}${ENDPOINT_NOTIFICATION_URL}${ENDPOINT_CREATE_NOTIFICATION_URL}

Fill title field in form notification
    [Arguments]    ${VALUE}
    Fill Text    ${TITLE_FIELD}    ${VALUE}

Clear title field in notification form
    Clear Text    ${TITLE_FIELD}

Validation message for empty title
    ${CURR_MSG}=    Get Text    ${VALIDATION_MSG_TITLE}
    Should Be Equal    ${CURR_MSG}    ${VALIDATION_MSG_EMPTY_TITLE_TEXT}

Validation message for title is more than 256 chars
    ${CURR_MSG}=    Get Text    ${VALIDATION_MSG_TITLE}
    Should Be Equal    ${CURR_MSG}    ${VALIDATION_MSG_MAX_CHARS_TITLE_TEXT}

Fill content field in form notification
    [Arguments]    ${VALUE}
    Fill Text    ${CONTENT_FIELD}    ${VALUE}

Clear content field in notification form
    Clear Text    ${CONTENT_FIELD}

Validation message for empty content
    ${CURR_MSG}=    Get Text    ${VALIDATION_MSG_CONTENT}
    Should Be Equal    ${CURR_MSG}    ${VALIDATION_MSG_EMPTY_CONTENT_TEXT}

Validation message for content is more than 256 chars
    ${CURR_MSG}=    Get Text    ${VALIDATION_MSG_CONTENT}
    Should Be Equal    ${CURR_MSG}    ${VALIDATION_MSG_MAX_CHARS_CONTENT_TEXT}

Select promo option in notification type
    Click    ${NOTIF_TYPE_FIELD}
    Click    ${PROMO_OPTION_NOTIF_TYPE}

Select coupon option in notification type
    Click    ${NOTIF_TYPE_FIELD}
    Click    ${COUPON_OPTION_NOTIF_TYPE}

Select information option in notification type
    Click    ${NOTIF_TYPE_FIELD}
    Click    ${INFORMATION_OPTION_NOTIF_TYPE}

Validation message for empty notification type
    ${CURR_MSG}=    Get Text    ${VALIDATION_MSG_NOTIF_TYPE}
    Should Be Equal    ${CURR_MSG}    ${VALIDATION_MSG_EMPTY_NOTIF_TYPE_TEXT}

Fill notification url field in new notification page
    [Arguments]    ${VALUE}
    Fill Text    ${NOTIFICATION_URL_FIELD}    ${VALUE}

Clear notification url field in notification form
    Clear Text    ${NOTIFICATION_URL_FIELD}

Validation message for empty notification url
    ${CURR_MSG}=    Get Text    ${VALIDATION_MSG_NOTIF_URL}
    Should Be Equal    ${CURR_MSG}    ${VALIDATION_MSG_EMPTY_NOTIF_URL_TEXT}

Validation message for notification url does not contain https
    ${CURR_MSG}=    Get Text    ${VALIDATION_MSG_NOTIF_URL}
    Should Be Equal    ${CURR_MSG}    ${VALIDATION_MSG_NOTIFICATION_URL_FORMAT_TEXT}

Coupon type is appear
    ${GET_COUPON_FIELD}=    Get Element    ${COUPON_FIELD}
    Wait For Elements State    ${GET_COUPON_FIELD}    visible

Select coupon
    [Arguments]    ${DROPDOWN_CONTAINER}=${COUPON_DROPDOWN_CONTAINER}
    Click    ${COUPON_FIELD}
    ${OPTIONS}=    Get Elements    ${DROPDOWN_CONTAINER}
    ${COUNT}=      Get Length    ${OPTIONS}
    ${INDEX}=      Evaluate    __import__('random').randint(0, ${count} - 1)
    Click    ${OPTIONS}[${INDEX}]

Validation message for empty coupon code
    ${CURR_MSG}=    Get Text    ${VALIDATION_MSG_COUPON}
    Should Be Equal    ${CURR_MSG}    ${VALIDATION_MSG_EMPTY_COUPON_TEXT}

Select Daily in send notification Type
    Click    ${SEND_NOTIF_TYPE_FIELD}
    Click    ${DAILY_OPTION_SEND_NOTIF_TYPE}

Select Once in send notification Type
    Click    ${SEND_NOTIF_TYPE_FIELD}
    Click    ${ONCE_OPTION_SEND_NOTIF_TYPE}

Select None in send notification Type
    Click    ${SEND_NOTIF_TYPE_FIELD}
    Click    ${NONE_OPTION_SEND_NOTIF_TYPE}

Select send notification type
    [Arguments]    ${DROPDOWN_CONTAINER}=${SEND_NOTIF_TYPE_DROPDOWN_CONTAINER}
    Click    ${SEND_NOTIF_TYPE_FIELD}
    ${OPTIONS}=    Get Elements    ${DROPDOWN_CONTAINER}
    ${COUNT}=      Get Length    ${OPTIONS}
    ${INDEX}=      Evaluate    __import__('random').randint(0, ${count} - 1)
    Click    ${OPTIONS}[${INDEX}]

Validation message for empty send notification type
    ${CURR_MSG}=    Get Text    ${VALIDATION_MSG_SEND_NOTIF_TYPE}
    Should Be Equal    ${CURR_MSG}    ${VALIDATION_MSG_EMPTY_SEND_NOTIF_TYPE_TEXT}

Active send Now
    Check Checkbox    ${SEND_NOW_CHECKBOX}

Upload push notification image
    [Arguments]    ${FILE}
    Upload File By Selector    ${PUSH_NOTIFICATION_IMAGE_FIELD}    ../assets/${FILE}

Click preview button in form notification
    Click    ${PREVIEW_BUTTON}

Modal image is appear
    Wait For Elements State    ${IMAGE_PREVIEW_MODAL}    visible

Validation message for empty push notification image
    Wait For Elements State    text=${VALIDATION_MSG_EMPTY_PUSH_NOTIFICATION_IMAGE_TEXT}    visible

Upload home screen image
    [Arguments]    ${FILE}
    Upload File By Selector    ${HOME_SCREEN_IMAGE_FIELD}    ../assets/${FILE}

Validation message for empty home screen image
    Wait For Elements State    text=${VALIDATION_MSG_EMPTY_HOME_SCREEN_IMAGE_TEXT}    visible

Click save button in form notification
    Sleep    .5s
    Click   ${SAVE_BTN} 

Click back button in form notification
    Click    ${BACK_BTN}

Validate modal message is
    [Arguments]    ${EXPECTED_MESSAGE}
    ${CURR_MSG}=    Get Text    text=${EXPECTED_MESSAGE}
    Should Be Equal    ${CURR_MSG}    ${EXPECTED_MESSAGE}
    