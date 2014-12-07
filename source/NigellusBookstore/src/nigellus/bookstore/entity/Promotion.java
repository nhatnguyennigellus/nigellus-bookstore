package nigellus.bookstore.entity;
// default package
// Generated Dec 6, 2014 11:22:10 AM by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * Promotion generated by hbm2java
 */
public class Promotion implements java.io.Serializable {

	private Integer id;
	private String promotionCode;
	private String discountType;
	private float discountAmount;
	private String description;
	private Date startDate;
	private Date endDate;
	private String status;

	public Promotion() {
	}

	public Promotion(String promotionCode, String discountType,
			int discountAmount, Date startDate, Date endDate, String status) {
		this.promotionCode = promotionCode;
		this.discountType = discountType;
		this.discountAmount = discountAmount;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
	}

	public Promotion(String promotionCode, String discountType,
			int discountAmount, String description, Date startDate,
			Date endDate, String status) {
		this.promotionCode = promotionCode;
		this.discountType = discountType;
		this.discountAmount = discountAmount;
		this.description = description;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPromotionCode() {
		return this.promotionCode;
	}

	public void setPromotionCode(String promotionCode) {
		this.promotionCode = promotionCode;
	}

	public String getDiscountType() {
		return this.discountType;
	}

	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}

	public float getDiscountAmount() {
		return this.discountAmount;
	}

	public void setDiscountAmount(float discountAmount) {
		this.discountAmount = discountAmount;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}