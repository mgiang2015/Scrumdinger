# Scrumdinger

## Introduction

Many software engineering teams use daily meetings, known as scrums, to plan their work for the day. Scrums are short meetings where each attendee discusses what they accomplished yesterday, what they are working on today, and any obstacles that might impact their work.

Scrumdinger is an iOS app that helps teams manage their daily scrums. To help keep scrums short and focused, Scrumdinger uses visual and audio cues to indicate when and how long each attendee should speak. The app also displays a progress screen that shows the time remaining in the meeting and creates a transcript that the users can refer to later.

This project was built following [iOS App Dev Tutorials](https://developer.apple.com/tutorials/app-dev-training/getting-started-with-scrumdinger) for me to learn app development with SwiftUI and XCode.

## Features

1. View list of all Scrums: The main app screen shows you a list of all scheduled scrums. Scrums take place daily, so
   these scrums do not go away after each meeting.

2. Detail view of a Scrum: Shows you the duration of scrum and team members involved. 

3. Add and edit Scrums.

4. Scrum timer and dinger: Once a scrum starts, the timer visually shows how much time has passed and is left. It
   allocates time evenly to each speaker. When a speaker's time is up, a "ding" sound is played to signal the next
   person.

5. Scrum history: View all past scrums and meeting notes.

6. Automatic voice recording and transcribing: The app records everything and transcribes it to text. This is for team
   members to quicky scan through what has been discussed.

7. Customization: Each scrum has a theme which the user can set, which customizes the color of the scrum in list view
   and the timer as well.

8. Persistent data: Data does not go away after you close the app.

## SwiftUI

Through this tutorial, I have learnt basic features of SwiftUI consisting of:

- View and PreviewProvider

- VStack, HStack, Navigation Stack, Sheet

- Themeing, Data passing, State-Binding, StateObject-Observable

- Asynchronous operations
