## Synopsis
This is a monitor of the RocketMQ tool. That is by using this kind of tool we can easily find all the information of consumers and providers of a specific Message Queue. Meanwhile, we can simply track the information of providers/consumers through a specific consumer/provider.

## Motivation
Why I developed this kind if project?</br>

  ### What MQ can help us do?
  RocketMQ is a open-source distributed messaging middleware, which adopted pub/sub message transmiting model. We use RocketMQ mainly in the following situations:</br>
  (1) Renew data in search index in distributed systems</br>
  (2) Buffer the pressure of other components. e.g., when we need to load a volume of data into database at peak time, 
  which is not urgent necessary. we can put the data into MQ firstly, and then consume it slowly.</br>
  (3) Platform independence data interaction. When we need to get data from other non-java departments, we use MQ to as a transmiting tool.
  ### What this project can help us do?
  When we exchange data with others, the normal RocketMQ model like this:</br>
  <img width=500 height=400 src="https://github.com/hitynsun/docs/blob/master/images/mq_model.png">
  
  In ideal conditions, when provider put message to the MQ, the message can be consumed by the consumer. However, developers always make some mistakes unconsciously. Think about what happened in the following model:
  
   <img width=500 height=400 src="https://github.com/hitynsun/docs/blob/master/images/mq_model_secret.png"></br>
   Firstly, when the provider try to add m2 to the MQ, there must be some ERROR occures, this kind of mistake can be easily detacted.</br>
   Secondly, how can we know if the consumer_1 secretly consume my message? Especially in distributed systems, it becomes much harder, because we don't know which computer the process in, the process number, we even don't know who is the owner of this process.</br>
   Thridly, how can we know the information of all providers through consumers? How can we know the information of all consumers through a provider?<br>
   This project is aimed at solving the second and the third problems listed above.
   
   ### Tracking all the consumers and providers of a specific Message Queue.
   In this project, I collected all the information of the providers and consumers when a topic was first built in the MQ jar, put all the data in a node of zookeeper, because I want the MQ jar depends on some light weight jar files. Then start a Dubbo Service to listen the change of the data in the node of zookeeper, when some changes are found, update the data in database. In the final end, I start a client read the data in Databese to show all the messages in this system.
   The work process like the following graph:</br>
   <img width=500 height=400 src="https://github.com/hitynsun/docs/blob/master/images/work%20process%20of%20monitor.png"></br>
   
   As we finally persist all the data in Database, it's earier for us to supervise all the changes of queues in the system. In the same way, if we want to know the consumers/providers of the provider/consumer, that is also very simple.
   
## How to use it?
Step1: Add one node of zookeeper names "mq_monitor"
Step2: Add two tables in Database according to these two mappers in the project: MQConsumerMapper.xml and MQProviderMapper.xml
Step3: Deploy the client:dj-mq-monitor-webapp
