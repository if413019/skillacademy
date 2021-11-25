*** Settings ***
Library  REST  https://skillacademy.com/
Variables  ../../../Resources/TestData/TestData.py


*** Test Cases ***
Verify GET courses with with specific page & page size
    GET  /skillacademy/discovery/search?page=${page}&pageSize=${pageSize}
    String  response body status  success
    String  response body message  success
    Integer  response body data page  ${page}
    Integer  response body data pageSize  ${pageSize}
    Array  response body data data
    [Teardown]  Output schema    


Verify GET courses with with searchQuery
    &{response}=  GET  /skillacademy/discovery/search?searchQuery=${ValidCourseName}
    String  response body status  success
    String  response body message  success
    ${courses}  Set Variable  ${response.body.data.data}
    FOR    ${course}    IN    @{courses}
        Should Contain  ${course.courseName}  ${ValidCourseName}  ignore_case=True
    END
    [Teardown]  Output schema    

       
