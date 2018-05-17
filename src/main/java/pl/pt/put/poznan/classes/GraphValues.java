package pl.pt.put.poznan.classes;

import java.sql.Timestamp;

public class GraphValues {
    private String symbol;
    private double AvgPrice;
    private Timestamp date;

    public GraphValues(String symbol, double AvgPrice, Timestamp date) {
        this.symbol = symbol;
        this.AvgPrice = AvgPrice;
        this.date = date;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public double getAvgPrice() {
        return AvgPrice;
    }

    public void setAvgPrice(double AvgPrice) {
        this.AvgPrice = AvgPrice;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

}
