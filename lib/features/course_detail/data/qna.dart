final Map<String, dynamic> question = {
  "image": "assets/images/instructor_8.jpg",
  "title":
      """ "unused element" warning on class Authenticated Session Controller """,
  "subtitle":
      """ after following the steps in this lesson, I am not getting a warning "unused element" for the class AuthenticatedSessionController """,
  "attachment": "assets/images/course/course_3.png",
};


final Map<String, dynamic> answer = {
    "image": "assets/images/instructor_8.jpg",
  "subtitle":
      """ Hi Abhijit,

Great question. There is a simple way to add a description to User Defined Functions (UDF) to help users understand what the function does, but in regards to your question about adding help text for each argument we will have to create a new Sub procedure to make this possible.



I will use our fGrade UDF as an example.

Step 1: Create a new Sub procedure. You can copy and paste the code below. Credit: https://wellsr.com/vba/2017/excel/vba-macrooptions-to-add-udf-description/



Sub RegisterUDF()



Dim strFunc As String   'name of the function you want to register

Dim strDesc As String   'description of the function itself

Dim strArgs() As String 'description of function arguments



    'Register fGrade function

    ReDim strArgs(1 To 2) 'The upper bound is the number of arguments in your function

    strFunc = "fGrade"

    strDesc = "fGrade calculates the new test score with curve applied."

    strArgs(1) = "Original test score."

    strArgs(2) = "Range of test scores to evaluate."

    Application.MacroOptions Macro:=strFunc, _

                             Description:=strDesc, _

                             ArgumentDescriptions:=strArgs, _

                             Category:="My Custom Category"

End Sub



Step 2: Run the new Sub procedure.



Step 3: In any cell insert our fGrade function and click the fx symbol just left of the formula bar to open the functions argument window and you will see our description of what this function does and if you click each individual argument you will see our help text for each argument.



TIP: In order to see this help text when we insert our function we must run our new Sub procedure first. To make this happen automatically I would suggest calling this Sub procedure with an Event, such as, Workbook.Open, so when users open this workbook the Sub will run and input our help text for this function.



I hope this helps and please let me know if you have any more questions, thanks! """,
};

