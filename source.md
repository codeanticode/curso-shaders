<section data-background="images/intro.jpg" style="color:#F6F6F6">
Programación de  Shaders en Processing
</section>

H:

<img width="300" src="images/processing_logo.png" class="plain">

¿Qué es Processing?

V:

<img src="images/processing_header.png" class="header">
<br><br><br>
Es un proyecto iniciado por Casey Reas y Ben Fry en el 2001, que promueve el uso del código como medio de expresión artística, y la cultura visual dentro de la tecnología. 
<br><br>
https://processing.org/

V:

<img height=600 src="images/processing_pde.png" class="plain">

V:

<img src="images/processing_api.png" class="plain">


H:

Un primer sketch de dibujo

<img src="images/primer_sketch.png" class="plain">

V:

<img height=600 src="images/processing_settings.png" class="plain">

V:

```java
float r = 0;

void setup() {
  size(300, 300);
  background(240, 53, 97); 
  stroke(20, 50, 150);
  fill(255, 100);
}

void draw() {  
  r = abs(30 * cos(frameRate));
  ellipse(mouseX, mouseY, r, r);  
}

void keyPressed() {
  background(240, 53, 97);  
} 
```

H:

<img src="images/processing_header.png" class="header">
<br><br><br>
* Código abierto: http://github.com/processing/

*  Comunidad: http://forum.processing.org/

*  Diversidad: http://processingfoundation.org

<br><br><br>

V:

<img height=500 src="images/processing_libs.png" class="plain">

V:

* [OpenCV for Processing](https://github.com/atduskgreg/opencv-processing): Procesamiento de imágenes y visión artificial

* [PixelFlow](https://github.com/diwi/PixelFlow): dinámica de fluidos, flujo óptico, cuerpos elásticos

* [proscene](https://github.com/remixlab/proscene): Manejo de cámara, sistemas de coordenadas y escenas interactivas

* [unfolding](http://unfoldingmaps.org/): Gráfico de mapas e información geográfica

V:

* [HE_Mesh](http://www.wblut.com/he_mesh/): Creación y manipulación de grillas poligonales

* [Syphon](https://github.com/Syphon/Processing): Compartir la salida gráfica entre distintas aplicaciones en Mac (Spout es el equivalente para Windows)

* [controlP5](http://www.sojamo.de/libraries/controlP5/): elementos de interfaz de usuario para controlar parámetros en un sketch

H:

cf. city flows (Till Nagel)

<img height=450 src="images/cityflows.png" class="plain">

https://uclab.fh-potsdam.de/cf/

H:

<section data-background="images/3D.jpg" style="color:#F6F6F6">
Gráficos 3D en Processing
</section>

H:

Un "Hola Mundo" 3D

<img height=400 src="images/hola_mundo_3d.png" class="plain">

V:

```java
float angulo = 0;

void setup() {
  size(640, 480, P3D);
  fill(#AD71B7);
}

void draw() {
  background(#81B771);
  
  lights();
  
  translate(width/2, height/2);
  rotateY(angulo);
  rotateX(angulo*2);
  box(200);
  
  angulo += 0.01;
}
```

V:

Algo un poco más complejo: una superficie 3D


<img height=400 src="images/terreno_3d.png" class="plain">

V:

```java
void setup() {
  size(640, 360, P3D);
  smooth(8);
  frameRate(120);
}

void draw() {
  background(150);  
  lights();
  translate(width/2, height/2);
  rotateX(QUARTER_PI);
  beginShape(QUADS);
  for (int i = 0; i < 50; i++) {
    for (int j = 0; j < 50; j++) {
      float x0 = map(i, 0, 50, -width/2, width/2);
      float y0 = map(j, 0, 50, -height/2, height/2);
      float x1 = x0 + width/50.0;
      float y1 = y0 + height/50.0;
      float t = 0.0001 * millis();
      float z1 = 100 * noise(0.1 * i, 0.1 * j, t);
      float z2 = 100 * noise(0.1 * (i + 1), 0.1 * j, t);
      float z3 = 100 * noise(0.1 * (i + 1), 0.1 * (j + 1), t);
      float z4 = 100 * noise(0.1 * i, 0.1 * (j + 1), t);
      vertex(x0, y0, z1);
      vertex(x1, y0, z2);
      vertex(x1, y1, z3);
      vertex(x0, y1, z4);
    }
  }
  endShape();
}
```

V:

<img width=100% src="images/coding_train.png" class="plain">

H:

Dibujando geometrías con gran número de vértices

```java
PVector[] coordenadas; 

void setup() {
  size(800, 600, P3D);

  String[] lineas = loadStrings("puntos.txt");  
  coordenadas = new PVector[lineas.length];
  for (int i = 0; i < lineas.length; i++) {
    String linea = lineas[i];
    String[] valores = linea.split(" ");
    float x = float(valores[0]);
    float y = float(valores[1]);
    float z = float(valores[2]);
    coordenadas[i] = new PVector(x, y, z);
  }  
  noStroke();
}

void draw() {
  background(255);
  
  fill(0);
  text(frameRate, 30, 30);
  
  fill(255, 0, 0);
  lights();
  translate(width/2, height/2, -1000);
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  for (PVector v: coordenadas) {
    pushMatrix();
    translate(v.x, v.y, v.z);
    sphere(10);
    popMatrix();
  }  
}
```

V:

<img height=500 src="images/nube_de_puntos_lenta.png" class="plain">

fps < 10

V:

Empaquetando geometría con PShape 

<img height=400 src="images/estrella_pshape.png" class="plain">

V:

```java
PShape star;

void setup() {
  size(640, 360, P2D);
  star = createShape();
  star.beginShape();
  star.fill(102);
  star.stroke(255);
  star.strokeWeight(2);
  star.vertex(0, -50);
  star.vertex(14, -20);
  star.vertex(47, -15);
  star.vertex(23, 7);
  star.vertex(29, 40);
  star.vertex(0, 25);
  star.vertex(-29, 40);
  star.vertex(-23, 7);
  star.vertex(-47, -15);
  star.vertex(-14, -20);
  star.endShape(CLOSE);
}

void draw() {
  background(51);
  translate(mouseX, mouseY);
  shape(star);
}
```

V:

Usando PShape para optimizar el código

```java
PVector[] coordenadas; 
PShape esferas;

void setup() {
  size(800, 600, P3D);

  esferas = createShape(GROUP);
  String[] lineas = loadStrings("puntos.txt");  
  coordenadas = new PVector[lineas.length];
  for (int i = 0; i < lineas.length; i++) {
    String linea = lineas[i];
    String[] valores = linea.split(" ");
    float x = float(valores[0]);
    float y = float(valores[1]);
    float z = float(valores[2]);
    coordenadas[i] = new PVector(x, y, z);
    PShape esfera = createShape(SPHERE, 10);
    esfera.translate(x, y, z);
    esfera.setFill(color(255, 0, 0));
    esfera.setStroke(false);
    esferas.addChild(esfera);
  }  
  noStroke();
}

void draw() {
  background(255);
  
  fill(0);
  text(frameRate, 30, 30);
  
  fill(255, 0, 0);
  lights();
  translate(width/2, height/2, -1000);
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  shape(esferas);
}
```

V:

<img height=500 src="images/nube_de_puntos_rapida.png" class="plain">

fps = 60

H:

Unnamed soundsculpture (onformative)

<img width=100% src="images/soundsculpture1.png" class="plain">

https://vimeo.com/38840688

V:

<img width=100% src="images/soundsculpture2.png" class="plain">

https://vimeo.com/38505448

H:

<img width=100% src="images/shaded_teapots.png" class="plain">
<br><br>
¡Finalmente, shaders!

V:

<img height=100% src="images/shade_trees1.png" class="plain">

V:

<img height=100% src="images/shade_trees2.png" class="plain">

V:

<img height=600 src="images/shade_trees3.png" class="plain">

H:

El pipeline gráfico

<img width=100% src="images/graphics_pipeline.png" class="plain">

V:

Paralelismo en el GPU
<img width=100% src="images/cpu_vs_gpu.png" class="plain">


V:

<img height=600 src="images/pipeline_full.png" class="plain">

V:

<img height=500 src="images/pipeline_part1.png" class="plain">


V:

<img height=600 src="images/pipeline_part2.png" class="plain">

V:

<img height=600 src="images/pipeline_part3.png" class="plain">

V:

<img width=100% src="images/book_of_shaders.png" class="plain">

http://thebookofshaders.com/

V:

Tutoriales
* http://www.lighthouse3d.com/tutorials/ 
* http://ogldev.atspace.co.uk/ 
* http://www.opengl-tutorial.org/ 
* https://open.gl 
* http://learnopengl.com/
* http://www.songho.ca/opengl/index.html 
* http://thebookofshaders.com/ 

V:

Técnicas avanzadas
* http://prideout.net/blog/
* http://paulbourke.net/
* http://http.developer.nvidia.com/GPUGems3

V:

Entornos de programación de shaders en la web
* https://www.shadertoy.com/
* http://glsl.heroku.com/
* https://www.vertexshaderart.com/


V:

<img width=100% src="images/shader_tutorial.png" class="plain">

https://processing.org/tutorials/pshader/

H:

Los videos musicales de Raven Kwok

<img height=400 src="images/raven_kwok.png" class="plain">

https://vimeo.com/ravenkwok

H:

<img width=100% src="images/from_flat_to_marble.png" class="plain">

H:

<img src="images/shader_types.png" class="header">
<br>
* Shaders de puntos (stroke points)
* Shaders de lineas (stroke lines)
* Shaders de color (geometría sin luces ni texturas)
* Shaders de texturado (geo texturada sin luces)
* Shaders de iluminación (geo iluminada sin texturas)
* Shaders de iluminación y texturado (todo)

H:

Processing + editor GLSL
<img width=100% src="images/processing_sublime.png" class="plain">

V:

Esfera color solido

V:

Esfera iluminada
* Iluminacion por vertice
* Iluminacion por pixel

V:

Esfera texturada

V:

Bump mapping

http://mmikkelsen3d.blogspot.com.ar/2011/07/derivative-maps.html

V: 

Specular mapping

V: 

Alpha mask

H:

flight404 (Robert Hodgins)

<img width=100% src="images/flight404_sol.png" class="plain">

https://vimeo.com/146875858

