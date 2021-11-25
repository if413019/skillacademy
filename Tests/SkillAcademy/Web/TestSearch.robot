*** Settings ***
Documentation  Search Course Feature test in SkillAcademy

Library  SeleniumLibrary

Resource  ../../../Resources/PageObjects/SkillAcademy/Common.robot
Resource  ../../../Resources/PageObjects/SkillAcademy/HomePage.robot
Resource  ../../../Resources/PageObjects/SkillAcademy/SearchPage.robot

Variables  ../../../Resources/TestData/TestData.py

*** Variables ***
${site_url}  https://skillacademy.com/
${browser}  Chrome

*** Test Cases ***
Verify successful search on SkillAcademy
    [documentation]  This test case verifies that user is able to search courses available in SkillAcademy
    [tags]  Smoke Test
    Opening Browser  ${site_url}  ${browser}
    Wait Until Homepage Successfuly Loaded
    Search For Courses  ${ValidCourseName}
    Verify Non-Empty Search Result
    Close Browser