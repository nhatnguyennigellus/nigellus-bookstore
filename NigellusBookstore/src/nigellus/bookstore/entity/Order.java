package nigellus.bookstore.entity;
// default package
// Generated Nov 30, 2014 2:46:00 PM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Order generated by hbm2java
 */
public class Order implements java.io.Serializable {

	private Integer id;
	private Customer customer;
	private Date orderDate;
	private float totalAmount;

	private String fullname;
	private String address;
	private String email;
	private String phone;
	private String status;
	private String confirmCode;
	
	public String getConfirmCode() {
		return confirmCode;
	}

	public void setConfirmCode(String confirmCode) {
		this.confirmCode = confirmCode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	private Set orderdetails = new HashSet(0);

	public Set getOrderdetails() {
		return orderdetails;
	}

	public void setOrderdetails(Set orderdetails) {
		this.orderdetails = orderdetails;
	}

	public Order() {
	}

	public Order(Customer customer, Date orderDate, float totalAmount) {
		this.customer = customer;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
	}

	public Order(Customer customer, Date orderDate, float totalAmount,
			Set orderdetailses) {
		this.customer = customer;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.orderdetails = orderdetailses;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Date getOrderDate() {
		return this.orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public float getTotalAmount() {
		return this.totalAmount;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

}
