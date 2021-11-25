*** Settings ***
Library  SeleniumLibrary
Variables  Locators/Locators.py

*** Keywords ***
Opening Browser
    [Arguments]  ${site_url}  ${browser}
    Open Browser  ${site_url}  ${browser}
    Maximize Browser Window

Search For Courses
    [Arguments]  ${keywords}
    Wait Until Navigation Bar Is Visible
    Input Text  ${SearchInput}  ${keywords}
    Click Element  ${SearchButton}
    
Wait Until Navigation Bar Is Visible
    [Timeout]    5
    Wait Until Element Is Visible  ${SkillAcademyLogo}
    Wait Until Element Is Visible  ${EnterpriseLink}
    Wait Until Element Is Visible  ${PrakerjaLink}
    Wait Until Element Is Visible  ${KategoriDropdown}
    Wait Until Element Is Visible  ${SearchInput}
    Wait Until Element Is Visible  ${SearchButton}
    Wait Until Element Is Visible  ${ReferralLink}
    Wait Until Element Is Visible  ${LoginButton}