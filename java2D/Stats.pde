class Stats {
  public Stat health = new Stat("Health", 100);
  public Stat speed = new Stat("Speed", 30);
  
  
  public int GetSpeed(){
    return speed.GetValue();
  }
  
  public int GetHealth(){
   return health.GetValue(); 
  }
}
