package product.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import mypage.model.vo.Shopping;
import product.model.vo.Product;
import product.model.vo.ProductImage;
import product.model.vo.ProductOption;
import product.model.vo.ShoppingCart;

public class ProductDAO {
	
private Properties prop = new Properties();
	
	public ProductDAO() {
		String fileName = ProductDAO.class.getResource("/sql/product/product-query.properties").getPath(); //드라이버 등록
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList selectPList(Connection conn) {
		Statement stmt = null; //건네줄게 없기때문에
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectPList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("p_no"),
									 rset.getString("p_name"),
									 rset.getInt("p_price"),
									 rset.getString("p_info"),
									 rset.getInt("p_count"),
									 rset.getInt("pc_no"),
									 rset.getDate("createdate"),
									 rset.getString("status")));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList selectFList(Connection conn) {
		Statement stmt = null; 
		ResultSet rset = null;
		ArrayList<ProductImage> list = null;
		
		
		String query = prop.getProperty("selectFList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<ProductImage>();
			
			while(rset.next()) {
				list.add(new ProductImage(rset.getInt("p_no"),
										  rset.getString("pi_change_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;
	}

	public int insertProduct(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertProduct");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getpName());
			pstmt.setInt(2, p.getpPrice());
			pstmt.setString(3, p.getpInfo());
			pstmt.setInt(4, p.getPcNo());
					
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertProductImage(Connection conn, ArrayList<ProductImage> fileList) {
		PreparedStatement pstmt = null;
		int result = 0; 
		System.out.println(fileList);
		String query = prop.getProperty("insertProductImage"); // insertAttachment : 키값
		
		 try {
			for(int i = 0; i < fileList.size(); i++) {
				ProductImage img = fileList.get(i);
				
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, img.getPiOriginName());
				pstmt.setString(2, img.getPiChangeName());
				pstmt.setString(3, img.getPiPath());
				pstmt.setInt(4, img.getFileLevel());
				
				result += pstmt.executeUpdate();				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Product selectProduct(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset  = null;
		Product product = null;
		
		String query = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				product = new Product(rset.getInt("p_no"),
								  rset.getString("p_name"),
								  rset.getInt("p_price"),
								  rset.getString("p_info"),
								  rset.getInt("p_count"),
								  rset.getInt("pc_no"),
								  rset.getDate("createDate"),
								 rset.getString("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		System.out.println(product);
		return product;
	}
	
	public int updateCount(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		int result = 0; 
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<ProductImage> selectProductImage(Connection conn, int pNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		ArrayList<ProductImage> list = null;
		
		String query = prop.getProperty("selectProductImg");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ProductImage>();
			
			while(rset.next()) {
				ProductImage pi = new ProductImage();
				pi.setPiNo(rset.getInt("pi_no"));
				pi.setpNo(rset.getInt("p_no"));
				pi.setPiOriginName(rset.getString("pi_origin_name"));
				pi.setPiChangeName(rset.getString("pi_change_name"));
				pi.setPiPath(rset.getString("pi_path"));
				pi.setPiDate(rset.getDate("pi_date"));
				pi.setStatus(rset.getString("status"));
				
				list.add(pi);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int updateProduct(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProduct");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getpName());
			pstmt.setInt(2, p.getpPrice());
			pstmt.setString(3, p.getpInfo());
			pstmt.setInt(4, p.getPcNo());
			pstmt.setInt(5, p.getpNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateProductImage(Connection conn, ArrayList<ProductImage> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProductImage");
		System.out.println(fileList); 
		
		 try {
				for(int i = 0; i < fileList.size(); i++) {
					ProductImage img = fileList.get(i);
					System.out.println("imgdao" + img);
					
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, img.getPiOriginName());
					pstmt.setString(2, img.getPiChangeName());
					pstmt.setString(3, img.getPiPath());
					pstmt.setInt(4, img.getFileLevel());
					pstmt.setInt(5, img.getpNo());
					
					result += pstmt.executeUpdate();
					System.out.println(result);//0
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}

	public int deleteProduct(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteProdut");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteProductImage(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteProdutImage");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		return result;
	}

	// 스니커즈 상품 
	public ArrayList<Product> selectSneList(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectSneList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("p_no"),
									 rset.getString("p_name"),
									 rset.getInt("p_price"),
									 rset.getString("p_info"),
									 rset.getInt("p_count"),
									 rset.getInt("pc_no"),
									 rset.getDate("createdate"),
									 rset.getString("status")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	//해당 상품 번호 이미지 
	public ArrayList selectFList(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductImage> list = null;
		
		
		String query = prop.getProperty("selectFList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ProductImage>();
			
			while(rset.next()) {
				list.add(new ProductImage(rset.getInt("p_no"),
										  rset.getString("pi_change_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
 
		return list;
	}


	public int insertCart(Connection conn, Shopping s) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCart");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, s.getSc_count());
			pstmt.setInt(2, s.getPo_size());
			pstmt.setInt(3, s.getP_no());
			pstmt.setString(4, s.getM_id());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		return result;
	}

	

	public Product selectProduct2(Connection conn, int pno, int posize) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		String query = prop.getProperty("selectProduct2");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pno);
			pstmt.setInt(2, posize);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product(rset.getInt("p_no"),
										rset.getString("p_name"),
										rset.getInt("p_price"),
										rset.getString("p_info"),
										rset.getInt("p_count"),
										rset.getInt("pc_no"),
										rset.getInt("po_size"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(p);
		return p;
	}


	public ArrayList<Product> selectListSearch(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectSearchProduct");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,"%" + keyword + "%");
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("p_no"),
									 rset.getString("p_name"),
									 rset.getInt("p_price"),
									 rset.getString("p_info"),
									 rset.getInt("p_count"),
									 rset.getInt("pc_no"),
									 rset.getDate("createdate"),
									 rset.getString("status")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ProductImage selectPiListSearch(Connection conn, int pno) {
		PreparedStatement pstmt = null;
		ResultSet rset  = null;
		ProductImage list = null;
		
		String query = prop.getProperty("selectSearchImage");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				list = new ProductImage(rset.getInt("pi_no"),
									  rset.getInt("p_no"),
									  rset.getString("pi_origin_name"),
									  rset.getString("pi_change_name"),
									  rset.getString("pi_path"),
									  rset.getDate("pi_date"),
									  rset.getInt("file_level"),
									 rset.getString("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		return list;

	}

	

	public ArrayList<Product> selectPoSortList(Connection conn,int pcNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectPopuList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pcNo);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("p_no"),
									 rset.getString("p_name"),
									 rset.getInt("p_price"),
									 rset.getString("p_info"),
									 rset.getInt("p_count"),
									 rset.getInt("pc_no"),
									 rset.getDate("createdate"),
									 rset.getString("status")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Product> selectNewSortList(Connection conn,int pcNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectnewproductlist");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pcNo);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Product>();
			while(rset.next()) {
				list.add(new Product(rset.getInt("p_no"),
									 rset.getString("p_name"),
									 rset.getInt("p_price"),
									 rset.getString("p_info"),
									 rset.getInt("p_count"),
									 rset.getInt("pc_no"),
									 rset.getDate("createdate"),
									 rset.getString("status")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Product> selectLowSortList(Connection conn,int pcNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectlowlist");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pcNo);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Product>();
			while(rset.next()) {
				list.add(new Product(rset.getInt("p_no"),
									 rset.getString("p_name"),
									 rset.getInt("p_price"),
									 rset.getString("p_info"),
									 rset.getInt("p_count"),
									 rset.getInt("pc_no"),
									 rset.getDate("createdate"),
									 rset.getString("status")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Product> selectHighSortList(Connection conn,int pcNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selecthighlist");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pcNo);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("p_no"),
									 rset.getString("p_name"),
									 rset.getInt("p_price"),
									 rset.getString("p_info"),
									 rset.getInt("p_count"),
									 rset.getInt("pc_no"),
									 rset.getDate("createdate"),
									 rset.getString("status")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Product> selectSneListSearch(Connection conn, String keyword, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectSneList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			pstmt.setString(2, "%" + keyword + "%");			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("p_no"),
									 rset.getString("p_name"),
									 rset.getInt("p_price"),
									 rset.getString("p_info"),
									 rset.getInt("p_count"),
									 rset.getInt("pc_no"),
									 rset.getDate("createdate"),
									 rset.getString("status")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Product> selectAllPoSortList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectAllPopuList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("p_no"),
									 rset.getString("p_name"),
									 rset.getInt("p_price"),
									 rset.getString("p_info"),
									 rset.getInt("p_count"),
									 rset.getInt("pc_no"),
									 rset.getDate("createdate"),
									 rset.getString("status")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Product> selectAllNewSortList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectAllNewList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("p_no"),
									 rset.getString("p_name"),
									 rset.getInt("p_price"),
									 rset.getString("p_info"),
									 rset.getInt("p_count"),
									 rset.getInt("pc_no"),
									 rset.getDate("createdate"),
									 rset.getString("status")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Product> selectAllLowSortList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectAllLowList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("p_no"),
									 rset.getString("p_name"),
									 rset.getInt("p_price"),
									 rset.getString("p_info"),
									 rset.getInt("p_count"),
									 rset.getInt("pc_no"),
									 rset.getDate("createdate"),
									 rset.getString("status")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Product> selectAllHighSortList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectAllHighList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("p_no"),
									 rset.getString("p_name"),
									 rset.getInt("p_price"),
									 rset.getString("p_info"),
									 rset.getInt("p_count"),
									 rset.getInt("pc_no"),
									 rset.getDate("createdate"),
									 rset.getString("status")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Product> selectRankSortList(Connection conn, String str) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectRankList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, str);		
			rset = pstmt.executeQuery();
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("p_no"),
									 rset.getString("p_name"),
									 rset.getInt("p_price"),
									 rset.getString("p_info"),
									 rset.getInt("p_count"),
									 rset.getInt("pc_no"),
									 rset.getDate("createdate"),
									 rset.getString("status")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int selectOption(Connection conn, int pno, int opsize) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectOption");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pno);
			pstmt.setInt(2, opsize);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				result = rset.getInt("po_no");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		
		return result;
	}
	public int insertCart(Connection conn, ShoppingCart s) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCart");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, s.getScCount());
			pstmt.setInt(2, s.getPoNo());
			pstmt.setInt(3, s.getpNo());
			pstmt.setString(4, s.getmId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		return result;
	}

	public ArrayList<ProductOption> selectOption(Connection conn, int pNo) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      ArrayList<ProductOption> option = new ArrayList<ProductOption>();
	      
	      String query = prop.getProperty("selectOptionAll");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, pNo);
	         
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	         ProductOption o = new ProductOption(rset.getInt("po_no"),
	                                 rset.getInt("po_size"),
	                                 rset.getNString("po_yn"),
	                                 rset.getInt("po_inventory"),
	                                 rset.getInt("p_no"));
	            option.add(o);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      close(conn);
	      return option;
	   }

	public int selectInventory(Connection conn, int i, int j) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int list = 0;
		
		String query = prop.getProperty("selectInventry");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, i);
			pstmt.setInt(2, j);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list = rset.getInt("po_inventory");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int updateInventry(Connection conn, int pono, int i) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateInventry");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pono);
			pstmt.setInt(2, i);
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	
}
