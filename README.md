# Documentation
*This readme provides you a overview of the whole project and a guideline to how start the project using Docker inside a vagrant virtual machine.*

***
<b>Title: </b> Documentation for our LSD project <br>
<b>Authors:</b>
- Andreas Styltsvig (cph-as283)
- Cherry Rose Semeña (cph-cs241)
- Diana Strele (cph-ds126)
- Mahnaz Karimi (cph-mk406)
- Mikkel Ziemer Højbjerg Jensen (cph-mj496)

<b>Date:</b> 25/10/2018<br>
<b>Assignment reference: </b> [LSD Project Description](https://github.com/datsoftlyngby/soft2018fall-lsd-teaching-material/blob/master/assignments/01-HN%20Clone%20Task%20Description.ipynb)<br>
<b>Github repositories for this project: </b> https://github.com/ProjectHackernewsGroup04

***
* A link to the front-page of you Hacker News Clone: http://46.101.43.21:3000/
* A link to the API for the simulator: http://46.101.43.21:5001/
* A link to the handover documentation for the operator group: same page


### What the application can do?

_See here: [API Documentation](https://github.com/ProjectHackernewsGroup04/Documentation/blob/master/API.md)_
***

# Start up

To start the project, you would need all repositories in order to get the project to run.

## 1. Cloning all repos

1. Cloning the documentation repo
`$ git clone https://github.com/ProjectHackernewsGroup04/Documentation.git`

2. Cloning rest of repos with this script
`$ sh Documentation/scripts/gitclone.sh`

3. Profit

## 2. Prepare your virtual machine with docker

You have to install following:
* **Vagrant virtual machine**
* **Docker**

### Installation guideline

1. Read and understand
https://github.com/datsoftlyngby/soft2018fall-lsd-teaching-material/blob/master/lecture_notes/03-Containers%20and%20VMs.ipynb
2. Install
3. Profit

## 3. Get the project up running

### 1. Install the vagrant virtual machine
1. `$ cd Ops/vm/`
2. `$ vagrant up`

### 2. Get the docker-compose containers up and running
1. `cd Ops/vm/`
2. `vagrant up`
3. `vagrant ssh`
4. profit

### 3. Start up the project locally
1. Make sure you have docker on your machine
2. `cd` into the cloned project
3. Write `docker-compose up -d` to run the entire system. 

This starts up a rabbitmq instance, two http-api applications, one to accept `student_tester.py` requests (helge-api) and one for the frontend to use (backend), a frontend project and a consumer for the rabbitmq.

## 4. Navigation

Goto `http://localhost:9000/newest`
Enjoy

### Issue tracker:
_In situations that you encountered some issues with our project, please make an open issue on its respective repository, and we will handle that the soonest._

_List of repositories and its purpose:_

- [Frontend](https://github.com/ProjectHackernewsGroup04/Frontend) - the web interface that the user can interact with, all the not yet implemented features will display "Not yet implemented" which are most likely not prioritized in the requirements. You can find the available features in the [API documentation](https://github.com/ProjectHackernewsGroup04/Documentation/blob/master/API.md)
- [Backend](https://github.com/ProjectHackernewsGroup04/Backend) - here, all the logics are handled and the one that communicates with the database. You can test against the backend by `curl` http://46.101.43.21:5000/api/	, use the [API documentation](https://github.com/ProjectHackernewsGroup04/Documentation/blob/master/API.md) for reference.
- [Helge-API](https://github.com/ProjectHackernewsGroup04/Helge-api) - this is especially made to handle Helge's requirements such as `/latest`, `/post` and `/status`, see the description [here](https://github.com/cph-cs241/soft2018fall-lsd-teaching-material/blob/master/assignments/03-Minimum_Requirements_and_API_Description.md). You can test against the helge-api by `curl` http://46.101.43.21:5001/api/
- [Ops](https://github.com/ProjectHackernewsGroup04/Ops) - Ops is responsible for building all the components of the application inside a virtual machine.

#### Common Errors:
- 400 - customized errors such as "bad login", or errors caught from the backend
- 500 - Backend error, usually occurs when it loses connection with the Database or when backend is down.
- 404 - "Not Found", wrong url.

---
