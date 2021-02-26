package com.party.models;

import java.text.NumberFormat;
import java.util.Locale;

public class OrderDetail {
    private String productName;
    private float subtotal;
    private float shipping;
    private float tax;
    private float total;
    NumberFormat nf = NumberFormat.getInstance(Locale.US); 
 
    public OrderDetail(String productName, String subtotal,
            String shipping, String tax, String total) {
        this.productName = productName;
        this.subtotal = Float.parseFloat(subtotal);
        this.shipping = Float.parseFloat(shipping);
        this.tax = Float.parseFloat(tax);
        this.total = Float.parseFloat(total);
    }
 
    public String getProductName() {
        return productName;
    }
 
    public String getSubtotal() {
        return String.format("%.2f", subtotal);
    }
 
    public void setTotal(float total) {
		this.total = total;
	}

	public String getShipping() {
        return String.format("%.2f", shipping);
    }
 
    public String getTax() {
        return String.format("%.2f", tax);
    }
     
    public String getTotal() {
        return String.format("%.2f",total);
    }
}