package pl.pt.put.poznan.classes;

public class Currency {
    private String symbol;
    private String name;
    private double priceInDollars;
    
    public Currency() {
        this.symbol = "none";
        this.name = "none";
        this.priceInDollars = 0;
    }
    
    public Currency(String symbol, String name, double priceInDollars) {
        this.symbol = symbol;
        this.name = name;
        this.priceInDollars = priceInDollars;
    }

    public String getSymbol() {
        return symbol;
    }

    public String getName() {
        return name;
    }
    
    public double getPriceInDollars() {
        return priceInDollars;
    }
}
