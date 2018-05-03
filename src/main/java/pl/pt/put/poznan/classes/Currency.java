package pl.pt.put.poznan.classes;

public class Currency {
    private final String symbol;
    private final String name;
    private final double avgPriceInDollars;
    private final double minPriceInDollars;
    private final double avgPriceInBitcoin;
    private final String marketName;
    
    public Currency(String symbol, String name, double avgPriceInDollars, double minPriceInDollars, double avgPriceInBitcoin, String marketName) {
        this.symbol = symbol;
        this.name = name;
        this.avgPriceInDollars = avgPriceInDollars;
        this.minPriceInDollars = minPriceInDollars;
        this.avgPriceInBitcoin = avgPriceInBitcoin;
        this.marketName = marketName;
    }

    public String getSymbol() {
        return symbol;
    }

    public String getName() {
        return name;
    }
    
    public double getAvgPriceInDollars() {
        return avgPriceInDollars;
    }

    public double getMinPriceInDollars() {
        return minPriceInDollars;
    }

    public double getAvgPriceInBitcoin() {
        return avgPriceInBitcoin;
    }

    public String getMarketName() {
        return marketName;
    }
}
