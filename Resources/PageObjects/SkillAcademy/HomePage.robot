*** Settings ***
Library  SeleniumLibrary
Variables  Locators/Locators.py

*** Keywords ***
Wait Until Homepage Successfuly Loaded
    [Timeout]    5
    Wait Until Element Is Visible  ${MenuCategories}
    