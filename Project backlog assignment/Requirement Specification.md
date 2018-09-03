# Requirement Specification Document (SRS) 
#### HackerNews project


# Purpose 
This SRS document describes the software functional and nonfunctional requirements for HackerNews Project.
HackerNews is a webpage, that allows registered users posting stories, and they can upvote or downvote each other stories.The registered users can write comments on stories.


# Intended Audience and Reading Suggestions
This document is intended to be used by members of the project team that will implement and verify
the correct functioning of the system. 

# Project Scope
* Create a clone of the HackerNews webpage
[https://news.ycombinator.com/](https://news.ycombinator.com/)

# HackerNews Scope
HackerNews is a web-based application that list stories posted by registered users. Users are able to post comments on stories posted by other users. The users can upvote or downvote stories, the application will show the most populate stories on top in descending order.

## Objectives and success criteria of the project

## References
[Assignment](https://github.com/datsoftlyngby/soft2018fall-lsd-teaching-material/blob/master/assignments/01-HN%20Clone%20Task%20Description.ipynb)

# Proposed system
### Features

## *  User management
| Feature | Description | 
|---|---|
| Create user  |  The system shall request the users to enter email-adresse and password to create a new account |
| User login  |  The system shall request the user to enter email-adresse and password to login, and check if the entered credentials are valid |
| User log off  |  The system shall provide a button for the logged users to click, so the user can be logged out |


## *  Story (Registered and logged users)

| Feature | Description | 
|---|---|
| Post comment |  The system shall allow the users to post comments on a story, and publish the comment. |
| Edit comment |  The system shall allow the users to edit their own comments |
| Delete comment |  The system shall allow the users to delete their own comment |
| Upvote |  The system shall allow the users to upvote a published story or a comment |
| Downvote |  The system shall allow the users to downvote a published story or a comment only if the user have over 500 karma points |

## *  Story (Not logged users)
| Feature | Description | 
|---|---|
| Post comment |  The system shall not allow the users to post comments on a story |
| Post comment |  The system shall not allow the users to edit comments on a story |
| Delete comment |  The system shall not allow the users to delete comments |
| Upvote |  The system shall not allow the users to upvote a published story or a comment |
| Downvote |  The system shall not allow the users to downvote a published story or a comment |

## *  Karma system / vote system
| Feature | Description | 
|---|---|
| Comment/story get a upvote  |  The system shall assign the upvote to the registered author of the story or the comment, so that the total of karmapoint for the author gets added with the amount of upvotes for the comment or story |
| Comment/story get a downvote  |  The system shall assign the downvote to the registered author of the story or the comment, so that the total of karmapoint for the author gets subtracted with the amount of downvotes for the comment or story |

## *  A story on the storyboard (Registered and logged users)
| Feature | Description | 
|---|---|
| The user clicks on the headline of a story |  The system shall redirects the user to the URL page |
| The user clicks on the authorname  |  The system shall redirects the user to the author profile page |
| The user clicks on the comment  |  The system shall redirects the user to the comments section for the story |
| The user clicks on the hide for the story  |  The system shall hide/remove the story from the storyboard exceptily for the user |
| The user clicks on the upvote icon for the story  |  The system shall assign the upvote to the author |
| The user clicks on the upvote text for the story  |  The system shall assign the upvote to the author |
| The user clicks on the "unvote" text for the story  |  The system shall remove the upvote from the author |

## *  A story on the storyboard (Not logged users)
| Feature | Description | 
|---|---|
| The user clicks on the headline of a story |  The system shall redirects the user to the URL page |
| The user clicks on the authorname  |  The system shall redirects the user to the author profile page |
| The user clicks on the comment  |  The system shall redirects the user to the comments section for the story |
| The user clicks on the hide for the story  |  The system shall hide/remove the story from the storyboard exceptily for the user |
| The user clicks on the upvote icon for the story  |  The system shall redirects the user to create user page |
| upvote button/text  |  The system shall make the text UNVISIBLE for users that is not logged |
| unvote button/text |  The system shall make the text UNVISIBLE for users that is not logged |


## *  Comment section for a single story (Registered and logged users)
| Feature | Description | 
|---|---|
| The user post a empty comment |  The system shall ask the user to write something in the comment field |
| The user post a comment and click "add comment"  |  The system shall publish the comment |
| The user clicks on the comment  |  The system shall redirects the user to the comments section for the story |
| The user clicks on reply for a published comment  |  The system shall show a textfield, so the user can reply to the comment |
| The user clicks on add comment as reply for a published comment  | The system shall publish the comment below the comment the user clicked reply to |
