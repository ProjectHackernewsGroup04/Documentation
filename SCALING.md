## Scaling

[link to the assignment](https://github.com/datsoftlyngby/soft2018fall-lsd-teaching-material/blob/master/assignments/12-DevOps_Scaling.md)

### Docker Swarm

Our components are deployed on a single server.
![](https://github.com/ProjectHackernewsGroup04/Documentation/blob/master/images/Screenshot%202018-11-24%20at%2014.05.57.png)

We chose to scale HackerNews project using horizontal scaling using Docker Swarm cluster.

### Guide

Inside vm of the project `cd /app/`:

* Add swarm to project: 

```docker swarm init```

* Set up a Docker registry: 

```docker service create --name registry --publish published=5002,target=5002 registry:2```


* Add Docker Swarm Visualizer to `docker-compose.yml` file, view on `localhost:2001`

```yml
visualizer:
    image: dockersamples/visualizer:stable
    ports:
      - "8080:8080"
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
    deploy:
      placement:
        constraints: [node.role == manager]
    networks:
      - overlay
```

* Make nodes with assigned replicas for services in `docker-compose.yml`

```yml
helge-api:
    image: hnclonecphb/http-api:master
    deploy:
      replicas: 3
      restart_policy:
        condition: on-failure
```

* To deploy application stack to the swarm:

```vagrant@vagrant:/app$ docker stack deploy --compose-file docker-compose.yml stackdemo```

```Terminal
Ignoring unsupported options: links

Creating network stackdemo_overlay
Creating config stackdemo_elastic_config
Creating config stackdemo_logstash_config
Creating config stackdemo_logstash_pipeline
Creating config stackdemo_kibana_config
Creating service stackdemo_logstash
Creating service stackdemo_helge-api
Creating service stackdemo_rabbitmq
Creating service stackdemo_database
Creating service stackdemo_elasticsearch
Creating service stackdemo_rabbitmq-consumer
Creating service stackdemo_frontend-app
Creating service stackdemo_backend
Creating service stackdemo_kibana
Creating service stackdemo_visualizer
```

* To see the services and replicas running:

```vagrant@vagrant:/app$ docker service ls```

