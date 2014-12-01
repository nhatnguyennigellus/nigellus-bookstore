package nigellus.bookstore.dao;

import java.util.List;

import nigellus.bookstore.entity.Cart;

public class CartDAO {
	public float totalPrice(List<Cart> list) {
		float total = 0;
		
		for (Cart cart : list) {
			total += cart.getQuantity() * cart.getBook().getUnitPrice();
		}
		return total;
	}
}
