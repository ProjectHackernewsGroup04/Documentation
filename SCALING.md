## Scaling

[link to the assignment](https://github.com/datsoftlyngby/soft2018fall-lsd-teaching-material/blob/master/assignments/12-DevOps_Scaling.md)

### Docker Swarm

Our components are deployed on a single server.
![](https://github.com/ProjectHackernewsGroup04/Documentation/blob/master/images/Screenshot%202018-11-24%20at%2014.05.57.png)

We chose to scale HackerNews project using horizontal scaling where we add more (virtual) machines to our cluster using Docker Swarm. This setup support scaleability and roll-on updating.

### Guide
step by step what we did with sequence of commands and screenshots with corresponding explanations.

Inside vm `/app/`:

1. Add swarm to project: 

```docker swarm init```

2. Set up a Docker registry: 

```docker service create --name registry --publish published=5002,target=5002 registry:2```

3. To deploy application stack to the swarm:

```docker stack deploy --compose-file docker-compose.yml stackdemo```


