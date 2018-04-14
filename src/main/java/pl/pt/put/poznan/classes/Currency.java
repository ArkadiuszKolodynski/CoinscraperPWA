package pl.pt.put.poznan.classes;

public class Currency {
    private String symbol;
    private String name;
    
    public Currency() {
        this.symbol = "none";
        this.name = "none";
    }
    
    public Currency(String symbol, String name) {
        this.symbol = symbol;
        this.name = name;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
