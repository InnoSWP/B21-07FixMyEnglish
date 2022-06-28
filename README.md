[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![dart](https://img.shields.io/github/languages/top/InnoSWP/B21-07FixMyEnglish)
![repo size](https://img.shields.io/github/repo-size/InnoSWP/B21-07FixMyEnglish)
![files](https://img.shields.io/github/directory-file-count/InnoSWP/B21-07FixMyEnglish)
# Fix my English by group 7

## Our motivation and project description
We built this project to help Innopolis University English department in checking students' works for academic style mistakes.We propose to use the special API integrated into our app that will look for academic style mistakes in students' works. Our motivation was to help to speed up the grading process for the English Department.

## How to use our app
Follow this [link](https://bs-07fixmyenglish.web.app/#/) to launch our app.
Click this [link]() to get redirected to a video demo.
1. On the home page the user can either upload PDF files or write the text directly in the special window.
![alt text](https://s3.image.hosting/2022/06/28/WU9HP.jpg)
After clicking “Upload files” button folder explorer will be opened and the user will be able to choose the files they want to upload. After selecting files they will be directed to the second screen.
Alternatively the user can type the text themselves. After clicking “Analyze text” button they will be directed to the third screen.
2. Uploading PDF files
![alt text](https://s3.image.hosting/2022/06/28/WUR7q.jpg)
On this page the user can inspect the mistakes made in the uploaded PDF files. 
They can click “Copy” button to copy the sentence with the mistake or, if they do not agree with this mistake, they can click “Report” button, and they will get a pop-up window, shown on the fourth screenshot.
By hovering over the highlighted mistake the user can view the explanation of the mistake.
By clicking on file names the user can switch between reports on different files.
Clicking cross on the file name will result in removal of report on this file. 
Clicking “Clear all” button will delete all reports and clicking “Upload” button will open folder explorer for the  user to be able to select more PDF files to check for mistakes
By clicking “Export to CSV” and “Export all to CSV” the user can export the opened report and all the reports respectively.
Clicking “Back to homepage” will direct the user to the home page.
3. Writing and edit the text
![alt text](https://s3.image.hosting/2022/06/28/WUmRS.jpg)
On this the user can inspect the mistakes made in text they typed in themselves.
Once again, “Copy”, “Report” and “Back to homepage” buttons have the same functionality as mentioned in the description about the second screen.
“Export” button.
In the space to the right of the report the user can type new text and after clicking “Analyze text” in the bottom right check it for mistakes.
4. Reporting false positive mistakes
![alt text](https://s3.image.hosting/2022/06/28/WUAWv.jpg)
In the report form the user is shown the sentence with the mistake they do not agree with. They also have space to write the justification of reporting the mistake. 
By clicking “Submit report” button they can send this report form to the developers.
## Features List
* Checking PDF files and typed in text for academic style mistakes
* Exporting reports into CSV
* Outputting sentences with highlighted mistakes
* Adding and removing reports on files
* Sending feedback regarding mistakes the user does not agree about

## Used frameworks
We used Flutter Web for developing and testing the app and Firebase for hosting and deployment.
