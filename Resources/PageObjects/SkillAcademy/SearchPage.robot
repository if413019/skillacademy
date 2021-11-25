*** Settings ***
Library  SeleniumLibrary

Variables  Locators/Locators.py
Variables  ../../TestData/TestData.py

*** Keywords ***
Verify Non-Empty Search Result
    Wait Until Element Is Visible  ${FilterHarga}
    Wait Until Element Is Visible  ${FilterDurasi}
    Wait Until Element Is Visible  ${PaginationPerPage}
    Wait Until Element Is Visible  ${CourseCards}
    Wait Until Element Is Visible  ${PaginationPrev}
    Wait Until Element Is Visible  ${PaginationNext}
    ${ActualTotalResult} =  Get Text  ${TotalResult}
    ${ActualTotalResult} =  Convert To Integer  ${ActualTotalResult}
    Should Be True  ${ActualTotalResult}>0
    Element Text Should Be  ${CurrentKeyword}  ${ValidCourseName}
    ${titles}=    Get WebElements    ${CourseTitles}
    FOR    ${title}    IN    @{titles}
        Element Should Contain  ${title}  ${ValidCourseName}  ignore_case=True
    END