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


# Content

Tasdable of content

---

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

## 4. Navigation

Goto `http://localhost:9000/newest`
Enjoy

		
---
