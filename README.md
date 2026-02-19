
# Dynamic analysis of vibration systems

## 📌 Overview

This project related to a new topic we learnt in our dynamics course called vibrations. This project tested our understanind of key concepts and the basic knowledge of spring-damper systems and how the response can affect real life scenarios. In this case, the scenario was a top loading washing machine with washing load in it and how different spring stiffness and damping coefficients affected the vibration induced from the machine as the RPM increased. We were also introduced to simulink and how to model responses from spring-damper systems.

## 🎯 Objectives
- Evaluate the equations of motions
- Derive the steady-state vibration amplitude
- Using my uniquely given values to calculate the natural frequency, damping ratio, and the damping coefficient with a different damping ratio
- Model the response of vibration amplitude, forces transmitted and transmissibility using simulink

## 🛠 Tools & Concepts Used
- MATLAB
- Vibrational Analysis
- Simulink


## 🔍 Methodology

To tackle this problem, I first had to read the brief and understand what I needed. I had to refer to my notes and coursebook to get a beter understanding of the fundamentals of the spring damper system and filter what was applicable in this scenario. Once I gathered the relevant information, I drew up Free Body Diagrams (FBD's) to aid in understanding the problem with the forces acting on the machine. After drawing the FBD's, I could state all the important assumptions and calculate the forcing term. The assumptions I made included that there was only a centriptal acceleration of the load acting on the washing machine, the only force acting on the machine is the tension force of the load, and the forcing term is only acting in the x direction. Once the forcing term was calculated, I could derive a full equation of motion. Using the equation of motion, I could derive the steady-state vibration amplitude. Using my given values, I could calculate the natural frequency, damping ratio, and the damping coefficient with a different damping ratio. 

After doing the calculations of my values, I turned to MATLAB and simulink for the modelling and analysis of the system. This was a particular difficult part of the project as we had never used simulink prior to this project. The understanding of how MATLAB workspace could be used in the simulink workspace was tricky to understand. Nevertheless, I still managed to complete the task and get the analysis of the different spring damper systems, with the help of tutorial sessions and brief instructions. 

## 📊 Results
<!-- From the analysis, we could see that as the machine speed increases, the vibration amplitude, transmitted forces and transmissibility increases and would peak at 250 rpm. The maximum vibration amplitude with damping ratio 1 (ζ1) was 28.48 mm, while with damping ratio 2 (ζ2), the maximum vibration amplitude was 11.05mm. The maximum amount of transmitted force was 89.91N with ζ1 and 36.69N with ζ2. Lastly, the transmissibility with ζ1 was 0.43 and with ζ2 was 0.19. 

From the graphs, I concluded that the the ζ2 line has a much lesser peak compared with ζ1, but still reaches a same steady state towards the higher speeds. This means that the vibration amplitude still reached the same steady state displacement, but the max displacement is signi?cantly lesser with the change in damping value. The transmitted forces also tends to reach a very high peak
with ζ1, but with ζ2, it does not reach a very high amount of force. However, with ζ1, the forces do decrease after the peak and tend to lead to a steady state at approximately 27.5N. With the ζ2, the force transmitted tends to increase after the peak as well, which could mean that the high damping value does reduce the peak force that acts on the wall of the machine, but it will increase as speed increases. The transmissibility also follows the same trend as the forces transmitted, which means that with ζ1, the transmissibility does decrease as speed goes up. With ζ2, the peak value of transmissibility is much lesser, but as speed increases, transmissibility increases as well. -->

From the analysis : As the machine speed increases, the vibration amplitude, transmitted forces and transmissibility increases and peaks at 250 rpm.

*Maximum vibration amplitude* <br>
Damping ratio 1 (ζ1) : **28.48 mm** <br>
Damping ratio 2 (ζ2) : **11.05 mm** <br>

*Maximum transmitted force* <br>
Damping ratio 1 (ζ1) : **89.1 N** <br>
Damping ratio 2 (ζ2) : **36.69 N** <br>

*Maximum Transmissibility* <br>
Damping ratio 1 (ζ1) : **0.43** <br>
Damping ratio 2 (ζ2) : **0.19** <br>

**Key Findings**
- ζ2 line has a much lesser peak compared with ζ1 line
- Vibration amplitude with ζ2 is lesser than with ζ1
- Vibration amplitude reaches same steady state at higher RPMs
- The high damping value does reduce the peak force that acts on the wall of the machine, but it will increase as RPMs increases
- The transmissibility also follows the same trend as the forces transmitted, where transmissibility increases as RPMs increase


## 📸 Project Images
(Add screenshots here)

## 📚 What I Learned
- Key engineering insights
- Challenges
- Improvements for future work
