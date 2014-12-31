package nigellus.bookstore.reports;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

public class ReportManagement {
	private Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/bookonline", "root", "123456");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public void top5BestSeller(String outputPath) {
		Connection cnn = null;
		try {
			String source = "D:\\jasper\\Top5BestSeller.jrxml";
			System.out.println(this.getClass().getCanonicalName());
			JasperReport jr = JasperCompileManager.compileReport(source);
			Map<String, Object> params = new HashMap<String, Object>();
			
			cnn = getConnection();
			JasperPrint jp = JasperFillManager.fillReport(jr, params, cnn);
			OutputStream os = new FileOutputStream(outputPath);
			JasperExportManager.exportReportToPdfStream(jp, os);
			
			os.flush();
			os.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (cnn != null && !cnn.isClosed()) {
					cnn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void printOrderReceipt(String id, String outputPath) 
	{
		Connection cnn = null;
		try {
			String source = "D:\\jasper\\exportOrder.jrxml";
			System.out.println(this.getClass().getCanonicalName());
			JasperReport jr = JasperCompileManager.compileReport(source);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", id);
			
			cnn = getConnection();
			JasperPrint jp = JasperFillManager.fillReport(jr, params, cnn);
			OutputStream os = new FileOutputStream(outputPath);
			JasperExportManager.exportReportToPdfStream(jp, os);
			
			os.flush();
			os.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (cnn != null && !cnn.isClosed()) {
					cnn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void monthWarehouse(String year, String month, String outputPath) {
		Connection cnn = null;
		try {
			String source = "D:\\jasper\\warehouseReport.jrxml";
			System.out.println(this.getClass().getCanonicalName());
			JasperReport jr = JasperCompileManager.compileReport(source);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("month", month);
			params.put("year", year);
			
			cnn = getConnection();
			JasperPrint jp = JasperFillManager.fillReport(jr, params, cnn);
			OutputStream os = new FileOutputStream(outputPath);
			JasperExportManager.exportReportToPdfStream(jp, os);
			
			os.flush();
			os.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (cnn != null && !cnn.isClosed()) {
					cnn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void yearIncomePerMonth(String year, String outputPath) {
		Connection cnn = null;
		try {
			String source = "D:\\jasper\\YearIncome.jrxml";
			System.out.println(this.getClass().getCanonicalName());
			JasperReport jr = JasperCompileManager.compileReport(source);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("year", year);
			
			cnn = getConnection();
			JasperPrint jp = JasperFillManager.fillReport(jr, params, cnn);
			OutputStream os = new FileOutputStream(outputPath);
			JasperExportManager.exportReportToPdfStream(jp, os);
			
			os.flush();
			os.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (cnn != null && !cnn.isClosed()) {
					cnn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
