package tad.bean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import tad.entity.Coupon;

public class CouponBean {
	private int couponId;
	private String name;
	private double discount;
	private String postingDate;
	private String expiryDate;
	private int quantity;
	private boolean status;
	private String detail;
	public CouponBean() {
		couponId = -1;
		name = "";
		discount = 0;
		postingDate = "";
		expiryDate = "";
		quantity = 0;
		status = false;
	}

	public CouponBean(Coupon coupon) {
		this.couponId = coupon.getCouponId();
		this.name = coupon.getName();
		this.discount = coupon.getDiscount();
		this.quantity = coupon.getQuantity();

		Date crrDate = coupon.getPostingDate();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		String formattedPostDate = formatter.format(crrDate);
		this.postingDate = formattedPostDate;

		if (coupon.getExpiryDate() != null) {
			String formattedExpiryDate = formatter.format(coupon.getExpiryDate());
			this.expiryDate = formattedExpiryDate;
		}
		this.status = coupon.getStatus();
		this.detail = coupon.getDetail();
	}

	public int getCouponId() {
		return couponId;
	}

	public void setCouponId(int couponId) {
		this.couponId = couponId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public String getPostingDate() {
		return postingDate;
	}

	public void setPostingDate(String postingDate) {
		this.postingDate = postingDate;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	// private boolean valid;
	public boolean getValid() {
		if (!status || (quantity <= 0))
			return false;
		try {
			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date exdate = inputFormat.parse(expiryDate);
			Date crrdate = new Date();
			int cmp = crrdate.compareTo(exdate);
			if (cmp > 0) // crr Date is after exdate
				return false;

		} catch (Exception e) {
			return false;
		}

		return true;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public long getDays()
	{
		try
		{
			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date exdate = inputFormat.parse(expiryDate);
			Date crrdate = new Date();

			return TimeUnit.DAYS.convert(exdate.getTime() - crrdate.getTime(), TimeUnit.MILLISECONDS);
		}
		catch(Exception ex)
		{
			return -1;
		}
		//return -1;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
}
