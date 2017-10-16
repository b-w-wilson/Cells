import java.util.Vector;

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
    
    // Vectors used to store special cells for easy access for the user.
    // Queens holds all the queens at all times.
    private static Vector<Cell> queens = new Vector<>();
    // When a cell is born with a significant mutation it is added to this Vector.
    private static Vector<Cell> mutations = new Vector<>();
    
    // Stats.
    private int attackStat;
    private int defenseStat;
    private int speedStat;
    private int lifeSpanStat;
    private float maxHungerStat;
    private int maxHealthStat;
    private int breedCoolDownStat;
    private int mutationChanceStat;
    
    // Variable measures of health.
    private int age = 0;
    private float hunger = 0;
    private float breedCooldownTimer;
    private float health;
    
    // Stats array (used for breeding/mutation).
    private float[] stats = {attackStat, defenseStat, speedStat, lifeSpanStat, maxHealthStat, breedCoolDownStat, maxHungerStat, mutationChanceStat};
  
    // Stores identifiers for the cell. Drone, Queen, Hunter ect. Users can add their own tags.
    private Vector<String> tags = new Vector<>(); 
    
    // Basic setup for the Cell. Like setting up vital tags. 
    private void setupCell(String colonyId) {
        checkColonyId(colonyId);
        tags.add(colonyId); // adds the colony id as the cell's first tag.
    }
    
    private void setStats(int[] parent1Stats, int[] parent2Stats) {
      
    }
    
    // Checks to see if a colonyId has been set, and sets it if not.
    private void checkColonyId(String colonyId) {
        if(colonyId == null) {
            this.colonyId = colonyId;
        }
    }
    
}