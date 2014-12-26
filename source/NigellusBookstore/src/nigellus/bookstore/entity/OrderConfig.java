package nigellus.bookstore.entity;

public class OrderConfig {
	private Integer id;
	private float min;
	private float max;
	private Integer active;
	
	
	public OrderConfig(Integer id, float min, float max, Integer active) {
		super();
		this.id = id;
		this.min = min;
		this.max = max;
		this.active = active;
	}

	public OrderConfig() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public float getMin() {
		return min;
	}

	public void setMin(float min) {
		this.min = min;
	}

	public float getMax() {
		return max;
	}

	public void setMax(float max) {
		this.max = max;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}
	
	
}
