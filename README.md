# Object Tracking
A simple code to detect and track an object. It is base on image processing and Euclidean distance. 

[To do] Add more description and examples

<img src = "https://github.com/macinj1/Object_Tracking/blob/main/figs/figure01.png" width = "1000">

![This is the caption\label{mylabel}]([/url/of/image.png](https://github.com/macinj1/Object_Tracking/blob/main/figs/figure01.png))

[image]: https://github.com/macinj1/Object_Tracking/blob/main/figs/figure01.png "Image Title" 
![Alt text][image] 
A reference to the [image](#image).

The code runs using the **main_particle_tracking.m** script. Set the parameters in **Define Parameters** section: 
  * file name and location
  * First, Last and Frame rate
  * time convertion, from frame to time [s, min,..]

## Running the code 

The code starts, one frame of the video pops up and you must select the area of interest, blue rectangle in next figure. 
Once you select the place, right click, and select **Crop Image**. 

<img src = "https://github.com/macinj1/Object_Tracking/blob/main/figs/figure02.png" width = "1000">

Next, on the Command Window, you receive the following requests. The number is needed to convert pixels to space units, then insert a known dimension of the blue box you selected before. 

<img src = "https://github.com/macinj1/Object_Tracking/blob/main/figs/CommandWindow.jpg" width = "1000">
