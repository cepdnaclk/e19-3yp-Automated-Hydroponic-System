---
layout: home
permalink: index.html

# Please update this with your repository name and project title
repository-name: eYY-3yp-Automated-Hydroponic-System
title: HydroGrowPro
---

[comment]: # "This is the standard layout for the project, but you can clean this and use your own template"

# Automated Hydroponic System

---


<!-- Image (photo/drawing of the final hardware) should be here -->

<!-- This is a sample image, to show how to add images to your page. To learn more options, please refer [this](https://projects.ce.pdn.ac.lk/docs/faq/how-to-add-an-image/) -->

<!-- ![Sample Image](./images/sample.png) -->

#### Table of Contents
1. [Introduction](#introduction)
2. [Introduction Video](#introduction-video)
3. [Why Us](#why-us)
3. [Target Market](#target-market)
4. [Solution Architecture](#solution-architecture )
5. [Hardware & Software Designs](#hardware-and-software-designs)
6. [Generation of Data](#generation-of-data)
7. [Power & Performance](#power-&-performance)
8. [Storage](#storage)
9. [Security & Privacy](#security-&-privacy)
10. [Testing](#testing)
11. [Demonstration Plan](#demonstration-plan)
12. [Scalability](#scalability)
13. [Detailed budget](#detailed-budget)
14. [Conclusion](#conclusion)
15. [Links](#links)

## Introduction

![logo](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/b2067de8-f540-4b09-bca7-f84b1f668fc4)
The project "IoT-Based Automated Hydroponic System" aims to develop a modern and sustainable approach to hydroponic farming that maximizes efficiency by using technology to monitor and control growth conditions, reducing resource consumption, and enabling users to make data-driven decisions for better crop management.
Customers want fresh, locally grown produce, and hydroponic farming provides an eco-friendly, space-efficient, and resource-saving solution. They are looking for high-quality, user-friendly, and automated hydroponic systems that can be easily monitored and managed remotely to meet their demand for convenience and sustainability.The market for hydroponic systems, particularly in urban and controlled environments, is growing. This presents an opportunity to develop a product 
that is not only cost-effective but also provides value by integrating automation and data-driven insights. Such a product can cater to the increasing demand for sustainable and efficient farming methods while remaining economically viable for both individual consumers and businesses

### Introduction Video
<video width="640" height="360" controls>
  <source src="videos/HYDROGROWPRO.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>


## Why Us

![comparison](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/9c9943de-80dc-475c-a93a-8f85d9a8bea2)


## Target Market

- Domestic users seeking effortless home gardening
- Adaptable for commercial-scale farming

## Solution Architecture

### High level system organization

![High level system organization](./images/Untitled-2023-11-19-1641223.png)

### Generation of Data

#### Sensor Data

- PH Sensor
- TDS Water Conductivity Sensor
- Float Switch

### Control Flow I
![CF1](./images/WhatsApp%20Image%202023-12-11%20at%2000.49.17_eeacbcfc.jpg)

### Control Flow II
![CF2](./images/WhatsApp%20Image%202023-12-11%20at%2001.02.47_c0c0e51e.jpg)


### Hardware Design

![Untitled Sketch_bb](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/6b776799-3f0d-408c-9f0f-6efabe07d232)

#### Interfacing

![Untitled Diagram drawio](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/2774fe1b-f786-4831-94c9-89f12635556d)

## User Interface

### Mobile Application

Our solution includes a dedicated mobile application, empowering users with continuous access and control over the hydroponic system. This mobile platform ensures round-the-clock interaction and monitoring capabilities, offering users unparalleled convenience and oversight at any hour.

## Web Application

For the web application while logging in the normal user will get the same facilities as the mobile user. But for the admin user, he/she will be able to add the kind of plants we can grow in the hydroponics system and preferred conditions for the plants. The user management and the registering the new system will also handled in the web application

#### Features & Functionalities

- The status of the pumps which are in the reservoir, resources( pH & Nutritional Solution )
- The measurement of the pH level and the TDS value of the reservoir
- The user will also get the details of the pH and nutritional sources in the system
- After the registration by the admin the user can add a new system in his account (in both 
  mobile and web) and he can select the plant he is going to grow in that system
- The user will get the notification about the system when there is an emergency situation l 
  ike continuous change in reading of the floating switch in the reservoir, when the     
  reservoir motor is switched off, and when the sources of the nutritional and pH solutions 
  are over.
- The user is able to switch off the pumps in the system for the maintainance kind of things.

#### For the normal Users
![image1](./images/Group%2016.png)
![image1](./images/Group%2019.png)
![image1](./images/Group%2018.png)
![image2](./images/Group%2013.png)
![image1](./images/Group%2014.png)
![image1](./images/Group%2015.png)

#### For admin users
![image3](./images/Group%2022.png)
![image3](./images/Group%2020.png)
![image3](./images/Group%2021.png)

## Security & Privacy
Our system have the sensitive datas like User details and credentials, device credentials, and the sensor data saved in the cloud and what sort of plants we have planted in the system. So if the unathorized people get the access to our system, they could be able to manipulate the the sensitive data.So we have implemented so many security features in our system.

This is how the security aspects of our system is handled.
1. Strong authentication & authorization
- Multifactor authentication
- Role based access
- Verification certificates for devices

2. Data Encryption
- JWT token
- MQTT (port : 8883) over TLS 
#### Security for Communication & Hardware

- Secure Firmware Update & Testing
- Network Security
- Device Authentication
- Secure Communication
- Secure Storage
- Access Control
- Physical Security 

## Testing

### Hardware Testing

- Use Unity Framework via Platformio for unit testing

![Unity](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/7e766aac-ab4a-4181-99ac-857bb5a3ab43)
![platformio](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/f09cd0df-2352-4c33-b075-b2f98365e3a3)

### Software Testing
- Unit testing with JUnit  
- Integrated testing with Flutter such as Unit tests, widget tests, and integration tests
- For the testing purpose of the React application Jest and React testing libraries 
- API testing with Postman
- Load & Stress Testing  with JMeter

### Dealing With Limitations

1. Contamination & Maintenance Requirement
   - Give users a weekly reminder via apps
   - Provide a detailed video guide via the mobile app
   - Provide a detailed guide via the user manual

 2. Value Drifts
    - Get two measurements from a sensor, calculate the average value and act accordingly

3. Dry Running Risk of Pumps
   - Connect the water pump to the bottom of the water reservoir
   - Give a notification when water level is significantly reduced



## Hardware Error Handling

- Error Checking Mechanisms
- Fail-Self Mechanism
- Watchdog Timers
- Power Switching Mode
- Reliable & Resilience Firmware
- Notification Mechanism

## Network Failure Handling

- Use MQTT inherent Features
- Local Storage Mechanism
- Message Buffering
- Periodic Retry

## Power & Performance

- Power Switching Mode
- Optimized Code
- Appropriate Hardware Items
- Optimized Data Communication
- Optimized Apps
- Caching Mechanism

## Demonstration Plan

- Reliable Functionality of Hardware Setup with Software Nodes
- Power Switching Capability
- Critical Situation and Responses

## Detailed budget

![Detailed Budget](./images/Detailed_budget.png)

<!--All items and costs

| Item          | Quantity  | Unit Cost  | Total  |
| ------------- |:---------:|:----------:|-------:|
| Sample item   | 5         | 10 LKR     | 50 LKR |-->


## Scalability

- Evaluating Space and Resources
- Cost-Effective Solution
- Monitoring & Maintenance
- Testing & Optimization

## Conclusion




## Team
-  E/19/060, Danujan S., [email](mailto:e19060@eng.pdn.ac.lk)
-  E/19/131, Hansachapa A.P.K., [email](mailto:e19131@eng.pdn.ac.lk)
-  E/19/166, W.W.K.Jayathunga, [email](mailto:e19166@eng.pdn.ac.lk)
-  E/19/224, M.M.S.H. Madhurasinghe, [email](mailto:e19224@eng.pdn.ac.lk)
-  E/19/266, Nithusikan T., [email](mailto:e19266@eng.pdn.ac.lk)


## GitHub Links

- [Project Repository](https://github.com/cepdnaclk/cepdnaclk/e19-3yp-Automated-Hydroponic-System)
- [Project Page](https://cepdnaclk.github.io/cepdnaclk/e19-3yp-Automated-Hydroponic-System)


### CN Portfolio Links

- [Danujan S.](https://www.thecn.com/DS1680)
- [Hansachapa A.P.K.](https://www.thecn.com/AH2396)
- [Jayathunga W.W.K.](https://www.thecn.com/WJ299)
- [Madhurasinghe M.M.S.H.](https://www.thecn.com/SM3179)
- [Nithusikan T.](https://www.thecn.com/NT1459)

