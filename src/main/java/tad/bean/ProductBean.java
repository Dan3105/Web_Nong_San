package tad.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import tad.entity.Product;

public class ProductBean {
	private int productId;
	private int categoryId;
	private String categoryName;
	private String productName;
	private Double price;
	private String image;
	private int quantity;
	private String detail;
	private String postingDate;
	private String unit;
	private int discountId;
	private double discount;
	private MultipartFile imageFile;
	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	public ProductBean() {
		productId = 0;
		categoryName = "";
		categoryId = -1;
		productName = "";
		price = 0d;
		image = "";
		quantity = 0;
		detail = "";
		
		Date crrDate = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = formatter.format(crrDate);
		postingDate = formattedDate;
		unit = "";
		discount = 0;
		discountId = -1;
	}
	
	public ProductBean(Product product)
	{
		productId = product.getProductId();
		categoryId = product.getCategory().getCategoryId();
		categoryName = product.getCategory().getName();
		productName = product.getProductName();
		price = product.getPrice();
		image = product.getImage();
		quantity = product.getQuantity();
		detail = product.getDetail();

		Date crrDate = product.getPostingDate();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = formatter.format(crrDate);
		postingDate = formattedDate;
		unit = product.getUnit();
		discount = product.getCoupon() != null ? product.getCoupon().getDiscount() : 0;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getPostingDate() {
		
		return postingDate;
	}
	

	public void setPostingDate(String postingDate) {
		this.postingDate = postingDate;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public int getDiscountId() {
		return discountId;
	}

	public void setDiscountId(int discountId) {
		this.discountId = discountId;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public double getTotalPrice()
	{
		return this.price - this.price * this.discount;
	}
}