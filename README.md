## Synopsis
RocketMQ is an excellent distributed messaging middleware developed by Alibaba and used by many Chinese IT companies. Business usually uses it for asynchronous communication, search, social network activity stream and data processes. When using it, there are some tiny tricks developers need to avoid.
This is a monitor tool of the RocketMQ to help developers avoid one of the tricks, by using this tool developers can easily detect all the messages of consumers and providers of a specific Message Queue. Meanwhile, developers can simply track the message of a provider/consumer through the message queue.

## Motivation
  ### What MQ can help us do?
  RocketMQ is a open-source middleware, which adopted pub/sub message transmission model. developers use RocketMQ mainly in the following situations:</br>
  (1) Renew data in search index in distributed systems</br>
  (2) Buffer the pressure of other components. e.g., when a business need to receive a volume of data and flush the data into a database at a peak time. It is rather possible to encounter concurrency issues either at the database end or the server end. However, RocketMQ is a perfect tool to avoid those issues. By putting the data into message queue firstly, and then consume it as required.</br>
  (3) Platform independence data interaction. When we need to get data from other non-java departments, we use MQ to as a transmission tool as well.
  ### What this project can help us do?
  RocketMQ is usually used as the following model in the scenario of exchanging data </br>
  <img width=500 height=400 src="https://github.com/hitynsun/docs/blob/master/images/mq_model.png">
  
  In ideal conditions, when provider put message to the MQ, the message can be consumed by the consumer who required. However, in the actual development process, it is quite normal for the engineers to allocate an incorrect message queue accidentally and consume a message not belongs to him. Think about what happened in the following scenario:
  
   <img width=500 height=400 src="https://github.com/hitynsun/docs/blob/master/images/mq_model_secret.png"></br>
   First, when the provider try to add m2 to the MQ, there should be an exception thrown, this type of mistake can be easily detected.</br>
   Second, how can we know if the consumer_1 secretly consume my message? Shooting this trouble in distributed systems will be an extremely tough work, because no one knows which task takes the message.</br>
   Last but not the least, how can we know the information of all providers through a consumer? How can we know the information of all consumers through a provider?<br>
   This project is aimed at solving the second and the third issues list above.
   
   ### Tracking all the consumers and providers of a specific Message Queue.
   In this project, the system will collect all the information of the providers and consumers at the time a topic was first created in the MQ, the collected data will be put in a node of zookeeper. 
   Then a project is launched to watch the node of zookeeper, when a change is detected, a new thread will be started to update the data in database.
   Finally, developers can search the data throw browser.
   The following graph illustrates this process:</br>
   <img width=500 height=400 src="https://github.com/hitynsun/docs/blob/master/images/work%20process%20of%20monitor.png"></br>
   
   It's easier for us to supervise all the changes of queues in the system. If you need to know the consumers/providers of a provider/consumer, just type in the keyword in the text on your browser.
   
## How to use it?
Step1: Add one node of zookeeper names "mq_monitor"</br>
Step2: Add two tables in Database according to these two mappers in the project: MQConsumerMapper.xml and MQProviderMapper.xml</br>
Step3: Launch the client:dj-mq-monitor-webapp</br>
