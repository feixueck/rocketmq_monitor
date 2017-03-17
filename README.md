## Synopsis
This is a monitor of the RocketMQ tool. That is by using this kind of tool we can easily find all the information of consumers and providers of a specific Message Queue.

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
  
   <img width=500 height=400 src="https://github.com/hitynsun/docs/blob/master/images/mq_model_secret.png">
   
   Firstly, when the provider try to add m2 to the MQ, there must be some ERROR occures, this kind of mistake can be easily detacted.</br>
   Secondly, how can we know if the consumer_1 secretly consume my message?</br>
   Thridly, how can we know the information of all providers from consumers? How can we know the information of all consumers from a provider?<br>
   
   This project is aimed at solving the second and the third problems listed above.
   
   ### Tracking all the consumers and providers of a specific Message Queue.
   In this project, I collected all the information of the providers and consumers when a topic was first built, 
   
