package nigellus.bookstore.dao;

import java.util.List;

import nigellus.bookstore.entity.Customer;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class CustomerDAO  extends HibernateDaoSupport{
	public boolean isAuthenticated(String username, String password) {
		String query = "select c from Customer c"
				+ " where c.username = '"+ username
				+ "' AND c.password = '" + password + "'";
		return getHibernateTemplate().find(query).size() > 0;
	}
	
	public boolean existedUsername(String username) {
		String query = "select c from Customer c"
				+ " where c.username = '"+ username + "'";
		return getHibernateTemplate().find(query).size() > 0;
	}
	
	public void addCustomer(Customer customer, String username) {
		getHibernateTemplate().save(customer);
	}
	
	public Customer getCustomerInfo(String username) {
		try {
			String query = "select c from Customer c"
					+ " where c.username = '" + username + "'";
			return (Customer) getHibernateTemplate().find(query).get(0);
		} catch (IndexOutOfBoundsException e) {
			return null;
		}
		
	}
	
	public void updateCustomer(Customer customer) {
		getHibernateTemplate().update(customer);
	}
	
	@SuppressWarnings("unchecked")
	public List<Customer> getCustomerList() {
		String query = "select c from Customer c";
		return getHibernateTemplate().find(query);
	}
}
