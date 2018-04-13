package pl.pt.put.poznan.classes;

public class Currency {
    private String symbol;
    private String name;
    private Byte[] logo;
    
    public Currency() {
        this.symbol = "none";
        this.name = "none";
        this.logo = null;
    }
    
    public Currency(String symbol, String name) {
        this.symbol = symbol;
        this.name = name;
        this.logo = null;
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

    public Byte[] getLogo() {
        return logo;
    }

    public void setLogo(Byte[] logo) {
        this.logo = logo;
    }
}
