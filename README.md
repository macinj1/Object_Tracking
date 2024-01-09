# Object Tracking

The present repository containts a simple code to detect and track an object. Image processing is based on thresholding after deleting background and particle tracking on Euclidean distance calculation. 

We want to detect and track objects in a image, few examples marked with blue circles in [figure 1](#image01).

[image01]: https://github.com/macinj1/Object_Tracking/blob/main/figs/figure01.png "Figure 1" 
![Alt text][image01] 

The code runs using the **main_particle_tracking.m** script. Set the parameters in **Define Parameters** section: 
  * file name and location
  * First, Last and Frame rate
  * time convertion, from frame to time [s, min,..]

## Running the code 

The code starts, one frame of the video pops up and you must select the area of interest, blue rectangle in next figure. 
Once you select the place, right click, and select **Crop Image**. 

[image02]: https://github.com/macinj1/Object_Tracking/blob/main/figs/figure02.png "Figure 2" 
![Alt text][image02] 

Next, on the **Command Window**, you receive the following requests:

<img src = "https://github.com/macinj1/Object_Tracking/blob/main/figs/CommandWindow.jpg" width = "1000">

The number is needed to convert pixels to space units, then insert a known dimension of the blue box you selected before ([figure 2](#image02)). 

## Code output

The results are listed as a set of cells in the variable **Particles**, where each one of them represents one particle with the following information

| time | x position | y position |
|---|---|---|
| t1 | x1 | y1 |
| . | . | . |
| . | . | . |
| . | . | . |
| . | . | . |
| tn | xn | yn |

A second variable is listed as **Particle_Velocity** with the following information

| time | x velocity | y velocity | net velocity |
|---|---|---|---|
| t1 | vx1 | vy1 | v1 |
| . | . | . | . |
| . | . | . | . |
| . | . | . | . |
| . | . | . | . |
| tn-1 | vxn-1 | vyn-1 | vn-1 |

It is calculated as first-orden difference. 

## Citation

Mac Intyre J., Simple Object Tracking (2023), GitHub repository, https://github.com/macinj1/Object_Tracking
