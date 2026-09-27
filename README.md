# 🤖 2-Link Planar Robotic Arm Kinematics & Trajectory Planning

![MATLAB](https://img.shields.io/badge/Made_with-MATLAB-blue.svg)

This project is a complete MATLAB implementation for analyzing and visualizing a 2-Link Planar Robotic Arm. Through a central interactive menu, users can define the link lengths (L1, L2) and choose between five different modes to study the robot's behavior.

---

## 🚀 Key Features

* **Forward Kinematics:** Calculates and visualizes the end-effector's final position based on user-defined joint angles.
* **Inverse Kinematics:** Computes the required joint angles (elbow-up configuration) to accurately reach specific target coordinates `(x, y)` in the workspace.
* **Trajectory Planning:** Generates and animates controlled end-effector paths. It supports straight line paths and circular trajectories, while simultaneously checking the arm's reachability limits.
* **Start-to-End Motion:** Smooth transition of the robotic arm from an initial state to a final target point. The movement is calculated using joint-space interpolation, ensuring valid configurations at every intermediate step.
* **Animation:** Dynamic, real-time visualization of the arm's movement with continuous path tracing on the plot.

---

## ⚙️ Execution

The main script of this project is `kinematics_final.m`. 

To start the simulation, simply run the following command in your MATLAB command window:
```matlab
kinematics_final
```

<img width="882" height="836" alt="Animation" src="https://github.com/user-attachments/assets/0ba285a0-6919-4ca0-9283-2cce0d96a0a8" />
