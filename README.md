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
  When we exchange data with others, the RocketMQ model like this:
