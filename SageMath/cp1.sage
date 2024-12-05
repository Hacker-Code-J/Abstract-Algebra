# Import necessary libraries
from sage.plot.plot3d.shapes2 import Sphere
from sage.plot.plot3d.all import line3d
import numpy as np

# Create a unit sphere with radius 1
sphere = Sphere(1)  # Radius of 1

# Create the stereographic projection lines
lines = []
for x in np.linspace(-1, 1, 6):  # Example lines
    for y in np.linspace(-1, 1, 6):
        if x**2 + y**2 <= 1:
            line = line3d([(0, 0, 1), (x, y, 0)], color="black", opacity=0.5)
            lines.append(line)

# Combine sphere and projection lines
projection = sphere
for l in lines:
    projection += l

# Animate by rotating the projection and saving each frame
angles = np.linspace(0, 2 * np.pi, 100)  # 100 frames
frames = []

for i, angle in enumerate(angles):
    # Rotate the projection around the z-axis by 'angle'
    rotated_projection = projection.rotate([0, 0, 1], angle)
    
    # Save each frame as an image
    filename = f"/mnt/data/frame_{i:03d}.png"  # Save the image to a file
    rotated_projection.show(viewer='threejs', figsize=[6, 6], frame=False, zoom=1.5, aspect_ratio=[1,1,1], 
                            color="gray", opacity=0.3, savefig=filename)
    
    # Keep track of the generated frame filenames
    frames.append(filename)

# Once all frames are generated, you can use them to create an animated GIF or video with external tools
print("All frames have been saved. You can use them to create an animation.")

