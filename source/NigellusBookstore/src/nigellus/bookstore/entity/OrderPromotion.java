package nigellus.bookstore.entity;

public class OrderPromotion {
	private Integer Id;
	private float Value;
	private String Type;
	private String Description;
	private Order order;
	
	public OrderPromotion() {
		// TODO Auto-generated constructor stub
	}

	public OrderPromotion(float value, String type,
			String description, Order order) {
		super();
		Value = value;
		Type = type;
		Description = description;
		this.order = order;
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public float getValue() {
		return Value;
	}

	public void setValue(float value) {
		Value = value;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
	
}
