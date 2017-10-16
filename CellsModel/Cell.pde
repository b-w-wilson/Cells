import java.util.Vector;
import java.util.Random;

/**
* @author Jay
* @version 1.0.0 16/10/17
* 
* Cell is the superclass of all the cells in the game, user made or auto generated.
* Cell will hold methods and variables to allow the cell to function, more
* advanced abilities and methods will be stored elsewhere.
*
*/
static class Cell {
  
    private String colonyId;
    private final boolean DEBUG = true;
    
    // Vectors used to store special cells for easy access for the user.
    // Queens holds all the queens at all times.
    private static Vector<Cell> queens = new Vector();
    // When a cell is born with a significant mutation it is added to this Vector.
    private static Vector<Cell> mutations = new Vector();
    
    // World details
    private int x;
    private int y;
    private color cellColour; // Colour the cell will be drawn in.
    
    // Stats.
    private float attackStat;
    private float defenseStat;
    private float speedStat;
    private float lifeSpanStat;
    private float maxHungerStat;
    private float maxHealthStat;
    private float breedCoolDownStat;
    private float mutationChanceStat;
    
    // Variable measures of health.
    private float age = 0;
    private float hunger = 0;
    private float breedCooldownTimer;
    private float health;
    
    // Misc multipliers
    private final float STANDARD_MUTATION_OFFSET = 0.01; // Percentage that mutation can go above or below parent's stats.
    private final float DRAMATIC_MUTATION_OFFSET = 2; // Percentage that mutation can go above or below parent's stats.
    private final float DRAMATIC_MUTATION_CHANCE = 0.000001; // Chance of a cell being born with a dramatic mutation.
    
    // Stats array (used for breeding/mutation).
    private float[] stats = {attackStat, defenseStat, speedStat, lifeSpanStat, maxHealthStat, breedCoolDownStat, maxHungerStat, mutationChanceStat};
  
    // Stores identifiers for the cell. Drone, Queen, Hunter ect. Users can add their own tags.
    private Vector<String> tags = new Vector(); 
    
    // Basic setup for the Cell. Like setting up vital tags. 
    private void setupCell(String colonyId, color c, float[]  parent1Stats, float[] parent2Stats) {
        checkColonyId(colonyId);
        tags.add(colonyId); // adds the colony id as the cell's first tag.
        dbgMsg("Set colony id as: " + colonyId);
        cellColour = c;
        setStats(parent1Stats, parent2Stats);
    }
    
    private float[] setStats(float[] parent1Stats, float[] parent2Stats) {
      
        dbgMsg("Setting stats");
        dbgMsg("Parent 1 Stats: " + dbgFloatArrayRead(parent1Stats));
        dbgMsg("Parent 2 Stats: " + dbgFloatArrayRead(parent2Stats));
        float[] childStats = new float[parent1Stats.length];
        for(int i = 0; i < parent1Stats.length; i++) {
            childStats[i] = map((float)Math.random(), 0, 1, parent1Stats[i] - (parent1Stats[i] * STANDARD_MUTATION_OFFSET),
            parent2Stats[i]  + (parent2Stats[i] * STANDARD_MUTATION_OFFSET));
        }
        
        dbgMsg("Child stats set");
        dbgMsg("Child Stats: " + dbgFloatArrayRead(childStats));
        
        return childStats;
    }
    
    // Checks to see if a colonyId has been set, and sets it if not.
    private void checkColonyId(String colonyId) {
        if(colonyId == null) {
            this.colonyId = colonyId;
        }
    }
    
    // Public methods to pass cell data.
    public int getX() {return x;}
    public int getY() {return y;}
    public color getCellColour() {return cellColour;}
    
    // Only prints to the console if DEBUG is set to true.
    // Good for debugging code, some of the time.
    private void dbgMsg(String msg) {
       if(DEBUG) {
           System.out.println("Cell: " + this + " <" + msg + ">"); 
       }
    }
    
    // Used to easily display the contents of float arrays in debug messages.
    private String dbgFloatArrayRead(float[] floatArray) {
      String str = "";
      if(DEBUG) {
        for(float item : floatArray) {
           str += item + " | "; 
        }
      }
      return str;
    }
    
}