import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;
PImage imagen;

Capture video;

OpenCV opencv;
Rectangle[] faces;

void setup(){
    size(1080, 720);
    imagen = loadImage("PUGSITO.png");
    
    video = new Capture(this, 1280, 720, "HD WebCam");
    video.start();

    opencv = new OpenCV(this, video);

    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
}

void draw(){
  image(opencv.getInput(),0,0);
  
    if (video.available() == true) {
        video.read();
        opencv.loadImage(video);
        
        image(video, 0,0);
        
        noFill();
        stroke(0, 255, 0);
        strokeWeight(3);
        faces = opencv.detect();
        
        for (int i = 0; i < faces.length; i++) {
            //rect(faces[i].x, faces[i].y, faces[i].width, faces[i]. height);
            imagen.resize(faces[i].width+25, faces[i].height+25);
            image(imagen, faces[i].x-12, faces[i].y-20);
        }
    }
}
