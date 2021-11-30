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
       
Verify GET courses with minimum and maximum price
    &{response}=  GET  /skillacademy/discovery/search?minPrice=${MinPrice}&maxPrice=${MaxPrice}
    String  response body status  success
    String  response body message  success
    ${courses}  Set Variable  ${response.body.data.data}
    FOR    ${course}    IN    @{courses}
        ${coursePrice}=  Convert To Integer  ${course.basePrice}
        Should Be True  ${coursePrice} >= ${MinPrice}
        Should Be True  ${coursePrice} <= ${MaxPrice}
    END
    [Teardown]  Output schema 

Verify GET courses ordered by highest rating
    &{response}=  GET  /skillacademy/discovery/search?sortBy=average_rating
    String  response body status  success
    String  response body message  success
    ${courses}  Set Variable  ${response.body.data.data}
    ${higherRating}  Convert To Number  ${response.body.data.data[0].rating}
    FOR    ${course}    IN    @{courses}
        ${courseRating}=  Convert To Number  ${course.rating}
        Should Be True  ${higherRating} >= ${courseRating}
        ${higherRating}  Set Variable  ${courseRating}
    END
    [Teardown]  Output schema   

Verify GET courses ordered by lowest rating
    &{response}=  GET  /skillacademy/discovery/search?sortBy=average_rating&orderBy=asc
    String  response body status  success
    String  response body message  success
    ${courses}  Set Variable  ${response.body.data.data}
    ${lowerRating}  Convert To Number  ${response.body.data.data[0].rating}
    FOR    ${course}    IN    @{courses}
        ${courseRating}=  Convert To Number  ${course.rating}
        Should Be True  ${lowerRating} <= ${courseRating}
        ${lowerRating}  Set Variable  ${courseRating}
    END
    [Teardown]  Output schema  

Verify GET courses ordered by most review
    &{response}=  GET  /skillacademy/discovery/search?sortBy=total_rating
    String  response body status  success
    String  response body message  success
    ${courses}  Set Variable  ${response.body.data.data}
    ${moreRating}  Convert To Number  ${response.body.data.data[0].totalRating}
    FOR    ${course}    IN    @{courses}
        ${totalRating}=  Convert To Number  ${course.totalRating}
        Should Be True  ${moreRating} >= ${totalRating}
        ${moreRating}  Set Variable  ${totalRating}
    END
    [Teardown]  Output schema   

Verify GET courses ordered by less review
    &{response}=  GET  /skillacademy/discovery/search?sortBy=total_rating&orderBy=asc
    String  response body status  success
    String  response body message  success
    ${courses}  Set Variable  ${response.body.data.data}
    ${lowerRating}  Convert To Number  ${response.body.data.data[0].totalRating}
    FOR    ${course}    IN    @{courses}
        ${totalRating}=  Convert To Number  ${course.totalRating}
        Should Be True  ${lowerRating} <= ${totalRating}
        ${lowerRating}  Set Variable  ${totalRating}
    END
    [Teardown]  Output schema  
