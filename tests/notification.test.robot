*** Settings ***
Library    String
Resource    ../resources/signin_keyword.robot
Resource    ../resources/notification_keyword.robot
Resource    ../helper/helper.robot

Test Setup    New Browser    headless=false
Test Teardown    Close Browser

*** Test Cases ***
Validate Notification Button is navigate to Notification Page
    Signin CMS
    Click Notification Menu from sidebar
    Verify user is on notification Page

Validate New Notification Button is navigate to Create Notification Page 
    Open create notification page
    Verify user is on create notification page

Validate validation message is appear if title is empty
    Open create notification page
    Fill title field in new notification page    ${EMPTY}
    Click save button in create notification page
    Validation message for empty title

Validate validation message is appear if title is more than 256 chars
    Open create notification page
    Fill title field in new notification page    ${256_TEXT}
    Click save button in create notification page
    Validation message for title is more than 256 chars

Validate validation message is appear if content is empty
    Open create notification page
    Fill content field in new notification page    ${EMPTY}
    Click save button in create notification page
    Validation message for empty content
    
Validate validation message is appear if content is more than 256 chars
    Open create notification page
    Fill content field in new notification page    ${256_TEXT}
    Click save button in create notification page
    Validation message for content is more than 256 chars

Validate validation message is appear if notification type is empty
    Open create notification page
    Click save button in create notification page
    Validation message for empty notification type
    
Validate validation message is appear if notification url is empty
    Open create notification page
    Fill notification url field in new notification page    ${EMPTY}
    Click save button in create notification page
    Validation message for empty notification url

Validate validation message is appear if notification url does not contain https
    Open create notification page
    Fill notification url field in new notification page    ${TEXT}
    Click save button in create notification page
    Validation message for notification url does not contain https

Validate coupon type is appear after select coupon in notification type field
    Open create notification page
    Select coupon option in notification type
    Coupon type is appear

Validate validation message is appear if coupon code is empty
    Open create notification page
    Select coupon option in notification type
    Click save button in create notification page
    Validation message for empty coupon code

Validate validation message is appear if send notification type is empty
    Open create notification page
    Click save button in create notification page
    Validation message for empty send notification type

Validate user can upload push notification image 
    Open create notification page
    Upload push notification image    ${IMAGE_100KB}

Validate user can preview push notification image 
    Open create notification page
    Upload push notification image    ${IMAGE_100KB}
    Click preview button in new notification page
    Modal image is appear

Validate validation message is appear if push notification image is empty
    Open create notification page
    Click save button in create notification page
    Validation message for empty push notification image

Validate validation message is appear if upload push notification image more than 1mb
    Open create notification page
    Upload push notification image    ${IMAGE_10MB}
    Validate modal message is    ${MODAL_MSG_MAX_IMAGE_SIZE_TEXT}

Validate user can upload home screen image 
    Open create notification page
    Upload home screen image    ${IMAGE_100KB}

Validate user can preview home screen image 
    Open create notification page
    Upload home screen image    ${IMAGE_100KB}
    Click preview button in new notification page
    Modal image is appear

Validate validation message is appear if home screen image is empty
    Open create notification page
    Click save button in create notification page
    Validation message for empty home screen image

Validate validation message is appear if upload home screen image more than 1mb
    Open create notification page
    Upload home screen image    ${IMAGE_10MB}
    Validate modal message is    ${MODAL_MSG_MAX_IMAGE_SIZE_TEXT}

Validate back to notification page on clicking back button from create notification page
    Open create notification page
    Click back button in crate notification page
    Verify user is on create notification page

Validation Message Appears When Create Notification With Notification Type is set to Coupon and Send Option is Daily
    ${UNIQUE_VALUE}    Generate timestamp
    Open create notification page
    Fill title field in new notification page    create_${UNIQUE_VALUE}
    Fill content field in new notification page    create_${UNIQUE_VALUE}
    Select coupon option in notification type
    Fill notification url field in new notification page    ${URL}
    Select coupon
    Select Daily in send notification Type
    Upload push notification image    ${IMAGE_100KB}
    Upload home screen image    ${IMAGE_100KB}
    Click save button in create notification page
    Validate modal message is    ${MODAL_MSG_NOTIF_TYPE_TEXT}

Validation Message Appears When Create Notification With Notification Type is set to Information and Send Option is Daily
    ${UNIQUE_VALUE}    Generate timestamp
    Open create notification page
    Fill title field in new notification page    create_${UNIQUE_VALUE}
    Fill content field in new notification page    create_${UNIQUE_VALUE}
    Select information option in notification type
    Fill notification url field in new notification page    ${URL}
    Select Daily in send notification Type
    Upload push notification image    ${IMAGE_100KB}
    Upload home screen image    ${IMAGE_100KB}
    Click save button in create notification page
    Validate modal message is    ${MODAL_MSG_NOTIF_TYPE_TEXT}

Validation Message Appears When Create Notification With Notification Type is set to Coupon and Send Option is Once
    ${UNIQUE_VALUE}    Generate timestamp
    Open create notification page
    Fill title field in new notification page    create_${UNIQUE_VALUE}
    Fill content field in new notification page    create_${UNIQUE_VALUE}
    Select coupon option in notification type
    Fill notification url field in new notification page    ${URL}
    Select coupon
    Select Once in send notification Type
    Upload push notification image    ${IMAGE_100KB}
    Upload home screen image    ${IMAGE_100KB}
    Click save button in create notification page
    Validate modal message is    ${MODAL_MSG_NOTIF_TYPE_TEXT}

Validation Message Appears When Create Notification With Notification Type is set to Information and Send Option is Once
    ${UNIQUE_VALUE}    Generate timestamp
    Open create notification page
    Fill title field in new notification page    create_${UNIQUE_VALUE}
    Fill content field in new notification page    create_${UNIQUE_VALUE}
    Select information option in notification type
    Fill notification url field in new notification page    ${URL}
    Select Once in send notification Type
    Upload push notification image    ${IMAGE_100KB}
    Upload home screen image    ${IMAGE_100KB}
    Click save button in create notification page
    Validate modal message is    ${MODAL_MSG_NOTIF_TYPE_TEXT}

Validation Message Appears When Create Notification With Notification Type is set to Information and Send Now is Active
    ${UNIQUE_VALUE}    Generate timestamp
    Open create notification page
    Fill title field in new notification page    create_${UNIQUE_VALUE}
    Fill content field in new notification page    create_${UNIQUE_VALUE}
    Select information option in notification type
    Fill notification url field in new notification page    ${URL}
    Select send notification type
    Active send Now
    Upload push notification image    ${IMAGE_100KB}
    Upload home screen image    ${IMAGE_100KB}
    Click save button in create notification page
    Validate modal message is    ${MODAL_MSG_NOTIF_TYPE_TEXT}

Validation Message Appears When Create Notification With Notification Type is set to Coupon and Send Now is Active
    ${UNIQUE_VALUE}    Generate timestamp
    Open create notification page
    Fill title field in new notification page    create_${UNIQUE_VALUE}
    Fill content field in new notification page    create_${UNIQUE_VALUE}
    Select coupon option in notification type
    Fill notification url field in new notification page    ${URL}
    Select coupon
    Select send notification type
    Active send Now
    Upload push notification image    ${IMAGE_100KB}
    Upload home screen image    ${IMAGE_100KB}
    Click save button in create notification page
    Validate modal message is    ${MODAL_MSG_NOTIF_TYPE_TEXT}