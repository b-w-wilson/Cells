public World world;

void setup() {
   fullScreen();
   background(0);
   float[] ps1 = {1.0, 5.0, 3.0};
   float[] ps2 = {2.0, 6.0, 2.0};
   Drone a = new Drone(ps1, ps2);
   Drone b = new Drone(ps1, ps2);
   Drone c = new Drone(ps1, ps2);
}