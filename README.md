___
# HydroGrowPro - Automated Hydroponic System
![logo](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/0c7a9f77-0f10-4899-8bee-feaffcaef557)

___


## Table of Contents

- [Overview](#overview)
- [Problem Statement](#problem-statement)
- [Why Us](#why-us)
- [Target Market](#target-market)
- [Hardware Design](#hardware-design)
- [Software Design](#software-design)
- [Augmented Features](#augmented-features)
- [High Level System Organization](#high-level-system-organization)
- [Generation of Data](#generation-of-data)
- [Storage](#storage)
- [Technology Stack](#technology-stack)
- [Security & Privacy](#security-&-privacy)
- [Power & Perfomance](#power-&-performance)
- [User Experience](#user-experience)
- [Design Decisions](#design-decisions)
- [Scalability](#scalability)
- [Testing](#hardware-testing)
- [Budget](#budget)
- [Links](#links)


## Overview

The project "IoT-Based Automated Hydroponic System" aims to develop a modern and sustainable approach to hydroponic farming that maximizes efficiency by using technology to monitor and control growth conditions, reducing resource consumption, and enabling users to make data-driven decisions for better crop management.Customers want fresh, locally grown produce, and hydroponic farming provides an eco friendly, space-efficient, and resource-saving solution. They are looking for high-quality, user-friendly, and automated hydroponic systems that can be easily monitored and managed remotely to meet their demand for convenience and sustainability.The market for hydroponic systems, particularly in urban and controlled environments, is growing. This presents an opportunity to develop a product that is not only cost effective but also provides value by integrating automation and data-driven insights. Such a product can cater to the increasing demand for sustainable and efficient farming methods while remaining economically viable for both individual consumers and businesses



https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/9afc8e9e-eadd-4472-b16f-01a3fefad074




## Problem Statement

Traditional farming methods typically rely on a piece of land with good soil quality and are highly susceptible to the unpredictability of weather conditions. Farmers often need to engage in manual labor, such as tilling, planting, weeding, and harvesting, which can be physically demanding and time-consuming. The success of these traditional farming methods is on factors like soil fertility, climate, and access to sufficient water.Hydroponic systems represent an innovative solution to these challenges. These systems enable plants to grow in a controlled environment without soil. Instead, they are nourished by nutrient rich water solutions. Hydroponics have gained popularity due to several advantages, such as Water Efficiency, Crop Yield Optimization, Minimized Pest and Disease Impact.
However, while hydroponic systems have clear benefits, they are not without their challenges. The key issue we are looking to address is the need for regular monitoring and adjustment of critical environmental parameters. This includes:

      1. pH Levels: The acidity or alkalinity of the water needs to be maintained within a specific range to ensure optimal nutrient absorption by plants.
      
      2. Nutrient Levels: The nutrient concentrations in the water need to be closely monitored and adjusted as plants grow and uptake nutrients.

      3. Water Levels: The water level of the reservoir should be measured in a regular manner to make sure that there is no leakage in the system

Failure to monitor and regulate these parameters effectively can lead to stunted plant growth, poor yield, or even crop failure in hydroponic systems. Current solutions on the market often provide basic automation, like timers for nutrient pumps and light control. However, these systems may not offer the level of precision and intelligence required to optimize plant growth and maximize crop yields.
The problem we are trying to solve is the need for an automated hydroponic system that leverages technologies such as embedded systems, network and web applications, computer and network security, and machine learning to efficiently manage and optimize these crucial environmental variables. Typically, hydroponic systems require human interaction when it comes to the regulation of certain elements that allow the plant to grow. The goal of our project is to make a system that is cost-effective and, most importantly, is completely automated and requires virtually no human interaction after placing the germinated plant into the system. The other aspect is to create a system that can be used by a typical consumer; meaning that it is relatively small and simple to use. By doing so, our system will provide an easier and more productive way for farmers and hobbyists to grow plants hydroponically, overcoming the limitations of existing solutions and ensuring better results with less manual intervention.


## Why Us

![comparison](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/99294a54-3c0a-4e49-8ea9-883b1e31225f)


## Target Market

- Domestic users seeking effortless home gardening
- Adaptable for commercial-scale farming


## Hardware Design

![new](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/6d6f9158-77a2-405f-a378-c28399600b12)

![model](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/1ec8d227-9b70-4bd4-bd61-eb7508469982)

### 3D Model

![Circuit Box v112](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/30d92916-6934-458e-bbcf-d45f5f3dcc9c)

![Circuit Box v114](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/4f89f385-7b0e-4a68-975e-3b9debfe6843)

#### 3D Model For Scalability

![Circuit Box v12 scalability1](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/a5c17668-cf99-4791-b888-77f18ce68e97)

### Dealing With Hardware Limitations

- Contamination & Maintenance Requirement
  1. Give weekly reminders to the users via the apps
  2. Provide a very detailed maintenance guide via the user manual

- Value Drifts
  1. Take 2 measurements from sensors and calculate the average value and act accordingly

- Dry Running Risk
  1. Connect the pump to the bottom of the water reservoir and give notification to users          when the water level changedsignificantly

### Hardware Interfacing

![Untitled Diagram drawio](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/113d1e59-4017-4fc0-bedc-bbc6656a2336)

### Hardware Error Handling

- Error Checking Mechanisms
- Fail-Self Mechanism
- Watchdog Timers
- Power Switching Mode
- Reliable & Resilience Firmware
- Notification Mechanism

### Network Failure Handling

- Use MQTT inherent Features
- Local Storage Mechanism
- Message Buffering
- Periodic Retry


## Software Design

### User Interface (Mobile Application)

Our solution includes a dedicated mobile application, empowering users with continuous access and control over the hydroponic system. This mobile platform ensures round-the-clock interaction and monitoring capabilities, offering users unparalleled convenience and oversight at any hour.

https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/61ed3c67-2578-48bd-91ad-0a7a36dd8ce7

### User Interface (Web Application)
For the web application while logging in the normal user will get the same facilities as the mobile user. But for the admin user, he/she will be able to add the kind of plants we can grow in the hydroponics system and preferred conditions for the plants. The user management and the registering the new system will also handled in the web application

https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/6a78b45f-eec6-4fb5-a974-b0785bb5970a

#### Features and Functionalities
- The status of the pumps which are in the reservoir, resources( pH & Nutritional Solution )
- The measurement of the pH level and the TDS value of the reservoir
- The user will also get the details of the pH and nutritional sources in the system
- After the registration by the admin the user can add a new system in his account (in both mobile and web) and he can select the plant he is going to grow in that system
- The user will get the notification about the system when there is an emergency situation like continuous change in reading of the floating switch in the reservoir, when the reservoir motor is switched off, and when the sources of the nutritional and pH solutions are over.
- The user is able to switch off the pumps in the system for the maintainance kind of things.
<!--ul>
      <li>Real-Time Monitoring : Users can view live sensor data for pH levels and Nutrient concentrations of their hydroponic setup.</li>
      <li>Customized Plant Management : The app allows users to access individual plant profiles, enabling specific adjustments tailored to each plant's unique needs.</li>
      <li>Alerts and Notifications : Receive instant alerts on the mobile app regarding critical conditions such as low pH levels, or low nutrient levels and any other deviations from optimal plant parameters.</li>
      <li>Remote Control : Users can remotely adjust settings and parameters like nutrient dosing and pH dosing within the hydroponic system.</li>
      <li>Data Analysis and Insights : The app provides historical data and analysis, offering insights into trends and patterns in plant health and environmental conditions.</li>
      <li>User Management : For commercial or shared systems, the app might include user access controls, allowing multiple users or teams to manage different aspects based on permissions.</li>
      <li>User Management : For commercial or shared systems, the app might include user access controls, allowing multiple users or teams to manage different aspects based on permissions.</li>
</ul-->

## Augmented Features

The augmented product features that will differentiate our IoT-Based Automated Hydroponic System from existing products are as follows:

      1. Ease of Use: Our system will feature a user-friendly interface accessible through web applications and mobile apps. This intuitive interface will simplify the control and monitoring of the hydroponic system, ensuring that users of varying technical backgrounds can operate it with ease. This feature will eliminate barriers to entry for individuals new to hydroponics and technology.
      2. Data-Driven Insights: Machine learning algorithms will be integrated to analyze data from various sensors. This data analysis will provide users with valuable insights and recommendations. For example,it can suggest optimal nutrient levels, predict growth rates, and detect issues like nutrient deficiencies in their early stages. These insights empower users to make informed decisions, optimize crop           growth, and reduce the risk of crop loss. For example, use ML models to predict optimal nutrient levels, detect patterns indicating plant health issues, or optimize lighting schedules based on historical data. Continuously improve these algorithms to enhance system efficiency and user experience.
      3. Network and Web Applications: Implement a secure communication protocol (HTTPS, MQTT, etc.) to transmit sensor data from the hydroponic system to a central server or cloud platform. Develop a web application for users to remotely monitor and control the system. Enable features like setting desired parameters, receiving notifications/alerts, and accessing historical data for analysis.
      4. Security: Robust security measures will be implemented to protect the system from cyber threats. Ensuring the confidentiality and integrity of data generated and stored is vital. By safeguarding the system against potential breaches, we provide peace of mind to users and protect sensitive information related to their hydroponic operations. Furthermore, Implement encryption techniques to secure       data transmission between the embedded system and the server/cloud. Use authentication mechanisms to ensure authorized access to the web application. Regularly update software and firmware to patch security vulnerabilities, ensuring the system is resilient against potential cyber threats.
      5. Scalability: The system will be designed to be scalable, enabling users to easily expand their hydroponic setups. This feature accommodates users with diverse needs, whether they start with a small scale system and later decide to scale up their hydroponic farming or experiment with different plant varieties.
      6. Affordability: Striving to keep the product cost-effective is a crucial factor. By offering an affordable solution, we make advanced hydroponic technology accessible to a broader range of users,including small-scale farmers and enthusiasts who might have budget constraints. This affordability contributes to the wider adoption of hydroponic farming.
      7. Customization: Allowing users to customize growth conditions for different plants is a valuable feature. It promotes versatility in hydroponic farming by tailoring the system to suit the specific needs of various plant types. This flexibility can accommodate a range of crops and growing preferences.

## High Level System Organization

![my](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/a25d2deb-b8de-4c5c-a157-2eece1e063f4)

![flow](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/1f32c3ae-c63d-4d29-80ef-69c58213170a)

## Generation of Data

### Sensor Data

- PH Sensor
- TDS Water Conductivity Sensor
- Float Switch


## Storage







## Security & Privacy
### Authentication
- User Authentication
- Central Unit Authentication

### Authorization
- Role Based Access

### Encryption
- JWT Token
- Time Out Mechanism
- MQTT protocol
- TLS
- Encryption in AWS server

### Security for Communication Hardware

- Secure Firmware Update & Testing
- Network Security
- Device Authentication
- Secure Communication
- Secure Storage
- Access Control
- Physical Security 


## Power & Performance

- Power switching mode
- Optimized Code 
- Appropriate hardware items
- Optimized data communication
- Optimized apps
- Caching Mechanism

## User Experience

- Eye Catching Outfit
- Improved Portability
- Easily Recognizable Liquid Input Ports
- Filleted Edges
- Proper Battery & Switch Ports
- Lower Cost
- Point to Remove Redundant Water
- Point to Change Old Water

## Design Decisions

- **Outer Walls** - To protect the electronics parts and other parts of the entire product
- **Nets** - To avoid entering unneccesary things (garbage, small animals), to have a better ventilation to the water tank and avoid using a airpump
- **Big Solution Bottles** - To avoid frequent refilling
- **Holes In the Bottom** = To avoid filling water in the outer tank (in an unexpected leakage or rainy situation)
- **Larger Tank** - To avoid frequent spilling of water and stop water wastage
- **Larger Circuit Box** - To reduce heating and proper connection between the parts in the entire system
- **Waterproof Design** - To protect the system from unexpected leakages
- **Two Power Modes** - To give the ability to the user to place the system in a place where no electricity is available
- **Replaceable Componente** - To give the ability to the user to replace the parts when there is a failure in one or two parts in the system
- **Suitable For Any Environment** - To give the ability to the users to use the system for domestic purposes or other outer usages 

## Scalability

- Evaluating space and resources
- Cost-Effective Solution
- Monitoring & Maintenance
- Testing and optimization

## Testing

### Hardware Testing

Implement unit testing with Unity framework via Platformio

![Unity](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/63a5c1b4-08eb-4c92-bbc0-c3daa5d29b78)

![platformio](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/411ffb51-3589-4b65-b81c-910deb19ecc3)

![testclient](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/bca300fd-5db1-45b6-8d38-f6cfc1e2f8d9)


### Software Testing

#### <b>Testing Java Spring Boot Backend:</b>

<b>Unit Testing:</b>

JUnit testing will be used to write unit tests for individual components, services, repositories, and controllers. Mock dependencies and test the functionality of each unit in isolation.

![jest](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/b601ce82-878b-4883-89ec-957569a40996)

<b>Integration Testing:</b> 

Verify the interaction between various components within the Spring context. Spring's testing annotations like @SpringBootTest to perform integration tests that cover multiple layers of the application

<b>REST API Testing:</b>

Postman will be used to test endpoints' functionality, input validation, error handling, and authentication/authorization mechanisms.

![postman](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/36febb33-2f9b-4c19-b7b0-fdd3971d8710)

<br>

<br>

#### <b>Testing React Web Application:</b>

<b>Unit Testing:</b> 

React Testing Library to write unit tests for individual React components. Test rendering, state changes, user interactions, and component behavior in isolation.

<b>Integration Testing:</b>


The integration of multiple components within the React application will be tested to ensure that different parts of the application work together as expected.

<br><br>

#### <b>Testing for Flutter Mobile Application:</b>

<b>Unit Testing:</b> 

Flutter's testing framework to write unit tests for individual widgets and test widget behavior, rendering, and interactions in isolation.


<b>Integration Testing:</b>

Flutter_driver package to perform integration tests that drive the app as a real user would, testing interactions across multiple screen

<img width="913" alt="selenium" src="https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/881f9b33-1fe2-4ecd-a7a3-e0fd74b97717">


### End-to-end-testing

The end to end testing is done by using Netsparker and NoGotofail

![netsparker](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/7a53d47f-5870-49c4-b34e-cc49da39f96e)
![NoGotofail](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/cb128b86-dc27-4dcc-8eb7-3377c8ac0044)

## Budget

![Detailed_budget](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System/assets/111074993/6c6aa0a3-b13d-4c98-9380-20a381706610)


      
In summary, these augmented features will set our IoT-Based Automated Hydroponic System apart from existing products by emphasizing ease of use, data-driven decision-making, security, scalability, affordability, and customization. By addressing these aspects, our system aims to meet the diverse needs and preferences of users while making hydroponic farming more accessible, efficient, and user-friendly.

## Links

- [Project Repository](https://github.com/cepdnaclk/e19-3yp-Automated-Hydroponic-System)
- [Project Page](https://cepdnaclk.github.io/e19-3yp-Automated-Hydroponic-System/)
- [Department of Computer Engineering](http://www.ce.pdn.ac.lk/)
- [University of Peradeniya](https://eng.pdn.ac.lk/)
