*** Keywords ***
Generate timestamp
    ${timestamp}=    Evaluate    int(__import__('time').time() * 1000)
    RETURN    ${timestamp}