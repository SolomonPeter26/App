Input master data:
List of International Standard Book Numbers (ISBNs).

User Flow:
User visits the home page of your application. Home page consists of a login form with one text field for username only.
User provides a username and is logged into the system. Note than an authentication system is NOT REQUIRED in this case.
After Login, a list of Books is displayed on a page.
User may
Browse more books
Like one or more books  
Based on the books liked by a user, the user is recommended more books on a sidebar of the Browse page.
Logic behind book recommender
Suggest the books liked by users who liked all or some of the books liked by the current user
Recommendations should not contain the books already liked by the user
