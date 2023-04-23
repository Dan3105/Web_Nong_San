package tad.bean;

import tad.entities.Product;

public class Cart {
	private Product prodcut;
	private double totalPrice;
	private int quantity;
	
	public Cart() {
	}
	public Cart(Product prodcut, double totalPrice, int quantity) {
		this.prodcut = prodcut;
		this.totalPrice = totalPrice;
		this.quantity = quantity;
	}
	public Product getProdcut() {
		return prodcut;
	}
	public void setProdcut(Product prodcut) {
		this.prodcut = prodcut;
	}
	public double getTotalPrice() {
		return this.quantity * this.prodcut.getPrice();
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	

}
