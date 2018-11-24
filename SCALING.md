# Scaling

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

```Terminal
vagrant@vagrant:/app$ docker service ls
ID                  NAME                          MODE                REPLICAS            IMAGE                                                     PORTS
shisytgeb5ox        registry                      replicated          1/1                 registry:2                                                *:5002->5002/tcp
25fp8xtp1ar3        stackdemo_backend             replicated          3/3                 hnclonecphb/backend:master                                *:5000->5000/tcp
za2brbxh7fec        stackdemo_database            replicated          1/1                 hnclonecphb/database:master                               *:27017->27017/tcp
y2co38pfm4kq        stackdemo_elasticsearch       replicated          1/1                 docker.elastic.co/elasticsearch/elasticsearch-oss:6.4.0   *:9200->9200/tcp, *:9300->9300/tcp
2btryqmwmibh        stackdemo_frontend-app        replicated          1/1                 hnclonecphb/frontend:master                               *:3000->3000/tcp
v5m9p0i5sdo0        stackdemo_helge-api           replicated          3/3                 hnclonecphb/http-api:master                               *:5001->5001/tcp
5s00g5jsvaw9        stackdemo_kibana              replicated          1/1                 docker.elastic.co/kibana/kibana-oss:6.4.0                 *:5601->5601/tcp
jzjb4ri1gysx        stackdemo_logstash            replicated          1/1                 docker.elastic.co/logstash/logstash-oss:6.4.0             *:5005->5005/tcp, *:9600->9600/tcp
q4exshu0r2hk        stackdemo_rabbitmq            replicated          3/3                 hnclonecphb/rabbitmq-docker:master                        *:5672->5672/tcp
wok29s5n7xgs        stackdemo_rabbitmq-consumer   replicated          3/3                 hnclonecphb/rabbitmq-consumer:master
mxwgso0yn41a        stackdemo_visualizer          replicated          1/1                 dockersamples/visualizer:stable                           *:8080->8080/tcp
```

### Rolling Updates

* Create `docker-stack.yml` in service repository. 
The `docker-stack.yml` loads the newest image from docker-hub, if the image from docker hub is newer then `docker-stack.yml` scheduals update for that service.

Here is a `docker-stack.yml` file for Backend service, where it pulls the newest image from deployed version in docker-hub.

```yml
version: '3.5'
services:
  backend:
    image: hnclonecphb/backend:master
    deploy:
      replicas: 3
      restart_policy:
        condition: on-failure
      update_config:
          delay: 30s
    ports:
      - "5000:5000"
    networks:
      - hackernews_ops
      - elk

networks:
  hackernews_ops:
    external: true
  elk:
    external: true
```
