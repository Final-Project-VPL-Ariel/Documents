# VPL+ :  Empowering Students and Practitioners in Programming Courses



## Project Goal
The main goal of this project is to enhance the existing Virtual Programming Lab (VPL) plugin for Moodle. The upgraded plugin will be tailored to the submission and assessment processes for various programming courses in the first and second years of the computer science degree program. The aim is to provide an efficient and user-friendly platform for students, practitioners, and lecturers to manage assignments and evaluations seamlessly.

## Target Audience
The upgraded VPL system caters to the following user groups:
- Students: Able to submit, review, and receive grades for their assignments. They can also test their code directly on Moodle before submitting.
- Practitioners/Lecturers/Assignment Checkers: Can review student submissions, evaluate code, and propose grades. They have the authority to finalize grades, run and evaluate code on Moodle, and modify assignment details and execution files.

## Key Features and Permissions
### Students:
- Test code on Moodle before final submission.
- Review their assignment submissions.
- Receive grades for their solutions.

### Practitioners/Lecturers/Assignment Checkers:
- Review student submissions and proposed grades from the VPL evaluator.
- Run and evaluate student code directly on Moodle.
- Edit assignments, tests, and VPL's execution files.

## System Description
The upgraded VPL system introduces the following features and functionalities:
- Practitioners can create new assignments using the VPL option on Moodle.
- Additional scripts will be integrated to run before the default VPL scripts for code execution and evaluation.
- For assignments submitted via GitHub URLs, one script will pull the student's repository from GitHub, while another will retrieve updated tests from the GitHub course repository.
- Students can test their code and receive a proposed grade based on the updated tests.
- Practitioners can view the proposed grade provided by the VPL system during code evaluation. They can then assign a final grade, taking into account the proposed grade and other relevant factors, such as late submissions.

This project aims to revolutionize the assignment submission and assessment process, making it more accessible and efficient for both students and practitioners. By integrating GitHub functionality and enhancing evaluation processes, we strive to create a more streamlined experience for all users involved.

## System Architecture

![image](https://github.com/Final-Project-VPL-Ariel/VPL/assets/93086649/09a32cc5-3ca6-4a8e-9766-d062e89dc370)

What is happening in backstage of a running task?

Connections when running task:

1. User clicks run button. Browser send request by === AJAX (json) === > to the VPL plugin in the Moodle server.
2. VPL plugin in Moodle Server prepare task and send data by === http/https (XMLRPC) === > to a selected execution server.
3. Execution Server starts the task and returns to VPL plugin in Moodle server the task identification.
4. VPL plugin in Moodle server returns to the browser the task identification.
5. The browser monitorize the task by connecting by === ws/wss === > to the execution Server.
6. The browser may connect with the running program by connecting by === ws/wss === > to the execution Server.
 

## Explainer Video: Understanding the Upgraded VPL System
Check out our video where we delve into the features and benefits of the upgraded VPL system, providing a clear understanding of how it enhances assignment submission, evaluation, and grading. 

[![Alt Click the image to view the video.]()](https://youtu.be/dsni0-FDYb8)

## Example Videos
### Uploading a programming task to VPL by the lecturer.

[![Alt Click the image to view the video.](https://img.youtube.com/vi/BPKGN0aTf20/1.jpg)](https://www.youtube.com/watch?v=BPKGN0aTf20)

### Uploading a task soultion to VPL by the student.
[![Alt text](https://img.youtube.com/vi/F_3IvnE1qeo/1.jpg)](https://www.youtube.com/watch?v=F_3IvnE1qeo)


*(Please note: The above information is a high-level overview of the project and its objectives. Further documentation and instructions can be found within the project repository.)*
