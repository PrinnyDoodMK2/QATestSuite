# Adjust results folder depending on the browser:
# python3 -m robot -d Results/FirefoxResults -i acceptance Tests/TestSuite/Alarms.robot

#To run swarm, use the command:
#python3 rfswarm.py

*** Settings ***
Documentation       Acceptance | Portfolio Regression
Library             SeleniumLibrary
Library             Screenshot
Library             WatchUI         tesseract_path=/usr/local/Cellar/tesseract/5.2.0/bin/tesseract
Resource            ../../Resources/Variables&Keywords/Variables.robot
Resource            ../../Resources/Variables&Keywords/Keywords.robot
Test Setup          Open Browser To ACCEPTANCE Login Page
Test Teardown       Finalize Test Case

*** Test Cases ***
Access Notifications Manager After Login
    [documentation]  After login, user should be able to check notifications management.
    [tags]  acceptance  regression  notifications  management  access

    Login Acceptance
    Access Notifications Manager


#S