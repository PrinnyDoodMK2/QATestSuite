# Adjust results folder depending on the browser:
# python3 -m robot -d Results/FirefoxResults -i acceptance Tests/TestSuite/Alarms.robot

# To run swarm, use the command:
# python3 rfswarm.py

*** Settings ***
Documentation       Acceptance | Users Manager Regression
Library             SeleniumLibrary
Library             Screenshot
Library             WatchUI         tesseract_path=/usr/local/Cellar/tesseract/5.2.0/bin/tesseract
Resource            ../../Resources/Variables&Keywords/Variables.robot
Resource            ../../Resources/Variables&Keywords/Keywords.robot
Test Setup          Open Browser To ACCEPTANCE Login Page
Test Teardown       Finalize Test Case

*** Test Cases ***
Access Users Manager
    [documentation]  This test case will simulate the login and access to the Users Manager
    [tags]  acceptance  regression  users  demonstration  access

    Login Acceptance
    Access Users Manager
    Sleep                                   1s
    Capture Page Screenshot                 ${VR_REFERENCE_IMAGE_FOLDER}/acceptance_users_manager_reference_1.png


Users Manager - Visual Regression
    [documentation]  This test case will performe a visual regression of the Users Manager list
    [tags]  acceptance  regression  visualregression  vr  users  demonstration

    Login Acceptance
    Access Users Manager
    Capture Page Screenshot                 ${ACCEPTANCE_VR_IMAGES_OBTAINED}/acceptance_users_manager_visual_regression_1.png
    Sleep                                   3s
    Compare Images                          ${VR_REFERENCE_IMAGE_FOLDER}/acceptance_users_manager_reference_1.png         ${ACCEPTANCE_VR_IMAGES_OBTAINED}/acceptance_users_manager_visual_regression_1.png      save_folder=${VR_COMPARISON_USERS}      ssim=1.00


Users - Account & Preferences
    [documentation]  Test case to verify if Account & Preferences is accessible
    [tags]  acceptance  regression  users  accountpreferencesaccess

    Login Acceptance
    Access Account & Preferences


Translations - Language Change
    [documentation]  Test case to validate language change in the application
    [tags]  acceptance  regression  users  accountpreferences  translations

    Login Acceptance
    Access Account & Preferences
    #Select the option Language & Timezone
    Click Element   //*[@id="language_timezone"]
    Page Should Contain     Language
    Page Should Contain Element     //*[@id="mui-component-select-language"]
    #Select the French language
    Click Element   //*[@id="mui-component-select-language"]
    Click Element   //*[@id="menu-language"]/div[3]/ul/li[2]
