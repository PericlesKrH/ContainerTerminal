package com.example.ContainerTerminal.Daos;


public class PriceDao {
 
    private int type;
    private int weight;
  
    private int total;

    public int getType() {
        return type;
    }

    @Override
    public String toString() {
        return "PriceDao{" + "type=" + type + ", weight=" + weight + ", + , total=" + total + '}';
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    



    
}
