package product.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import mypage.model.vo.Shopping;
import product.model.dao.ProductDAO;
import product.model.vo.ProductImage;
import product.model.vo.ProductOption;
import product.model.vo.ShoppingCart;
import product.model.vo.Product;

public class ProductService {

	public ArrayList selectTList(int i) { // 모두 받을 수 있게함
		Connection conn = getConnection();
		
		ArrayList list = null;
		
		ProductDAO dao = new ProductDAO();
		
		if(i == 1) {
			list = dao.selectPList(conn);
		}else {
			list = dao.selectFList(conn);
		}
		
		close(conn);
		
		return list;
	}

	public int insertProductImage(Product p, ArrayList<ProductImage> fileList) {
		Connection conn = getConnection();
		
		ProductDAO dao = new ProductDAO();
		
		int result1 = dao.insertProduct(conn, p);
		int result2 = dao.insertProductImage(conn, fileList);
		
		System.out.println(result2);
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1; 
	}

	public Product selectProduct(int pNo) {
		Connection conn = getConnection();
		
		int result = new ProductDAO().updateCount(conn, pNo);
		
		Product product = null;
		if(result > 0) {
			product = new ProductDAO().selectProduct(conn, pNo);
			
			
			if(product != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		
		close(conn);
		System.out.println("selectProductService: " + product);
		return product;
	}

	

	public ArrayList<ProductImage> selectProductImage(int pNo) {
		Connection conn = getConnection();
		
		//count업데이트
		int result = new ProductDAO().updateCount(conn, pNo);

		ArrayList<ProductImage> list = null;
		if(result > 0) {
			list = new ProductDAO().selectProductImage(conn, pNo);
		System.out.println();
			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}else {
			rollback(conn);
		}
		close(conn);
		return list;
	}

	public int updateProductImage(Product p, ArrayList<ProductImage> fileList) {
		Connection conn = getConnection();
		
		ProductDAO dao = new ProductDAO();
		System.out.println(fileList);
		
		int result1 =  dao.updateProduct(conn, p);
		int result2 = 0;
			System.out.println("updateService1 : " + result1);
			System.out.println("updateService2 : " +result2);
			
			if(fileList.size() == 0) {
				result2 = 1; 
			}else {
				result2 = dao.updateProductImage(conn, fileList);
			}
			
			if(result1 > 0 && result2 > 0) {
				commit(conn);
			}else {
				System.out.println("plz");
				rollback(conn);
			}
			
			close(conn);
			
			return result1; 
		}

	public int deleteProduct(int pNo) {
		Connection conn = getConnection();
		
		ProductDAO dao = new ProductDAO();
		
		int result1 = dao.deleteProduct(conn, pNo);
		int result2 = 0;
		//System.out.println("result1" + result1); 
		
		if(result1 > 0) {
			   result2 = dao.deleteProductImage(conn, pNo);
							
				if(result2 > 0) {
					commit(conn);
				}else {
					rollback(conn);
				}
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		System.out.println(result2); 
		
		return result2;
	}

	
	//스니커즈 상품 불러오는 곳
	public ArrayList<Product> selectSneList(int i, int no) {
		Connection conn = getConnection();
		
		ArrayList list = null;
		
		ProductDAO dao = new ProductDAO();
		
		if(i == 1) {
			list = dao.selectSneList(conn, no);
		}else {
			list = dao.selectFList(conn, no);
		}
		
		close(conn);
		
		return list;
	}

	public ArrayList<Product> selectSneList(int no) {
	   Connection conn = getConnection();
			
			
		ArrayList<Product> result = new ProductDAO().selectSneList(conn, no);
			
		close(conn);
		
		return result;
	}


	
//	// 장바구니 
//	public int selectShoppingCart(int opsize) {
//		Connection conn = getConnection();
//		
//		int result = new ProductDAO().selectShoppingCart(conn, opsize);
//		
//		if(result > 0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		return result;
//	}

	public ArrayList<Product> selectListSearch(String keyword) {
		Connection conn = getConnection();
		
		ArrayList<Product> list = null;
		
		
			list = new ProductDAO().selectListSearch(conn,keyword);

			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		close(conn);
		return list;
	}
	public int selectOption(int pno, int opsize) {
		Connection conn = getConnection();
		
		ProductDAO dao = new ProductDAO();
		
		int result = dao.selectOption(conn, pno, opsize);
		
		
		close(conn);
		return result;
	}
	
	public int insertCart(ShoppingCart s) {
		Connection conn = getConnection();
		
		ProductDAO dao = new ProductDAO();
		
		int result = dao.insertCart(conn, s);
		
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ProductImage selectPiListSearch(int pno) {
		Connection conn = getConnection();

		ProductImage list = null;
		
			list = new ProductDAO().selectPiListSearch(conn, pno);
		
			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		
		close(conn);
		return list;
	}

	public ArrayList<Product> selectPoSortList(int pcNo) {
		Connection conn = getConnection();
		
		ArrayList<Product> list = null;
		
		
			list = new ProductDAO().selectPoSortList(conn,pcNo);

			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		close(conn);
		return list;
	}

	public ArrayList<Product> selectNewSortList(int pcNo) {
		Connection conn = getConnection();
		
		ArrayList<Product> list = null;
		
		
			list = new ProductDAO().selectNewSortList(conn,pcNo);

			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		close(conn);
		return list;
	}

	public ArrayList<Product> selectLowSortList(int pcNo) {
		Connection conn = getConnection();
		
		ArrayList<Product> list = null;
		
		
			list = new ProductDAO().selectLowSortList(conn,pcNo);

			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		close(conn);
		return list;
	}

	public ArrayList<Product> selectHighSortList(int pcNo) {
		Connection conn = getConnection();
		
		ArrayList<Product> list = null;
		
		
			list = new ProductDAO().selectHighSortList(conn,pcNo);

			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		close(conn);
		return list;
	}

	public ArrayList<Product> selectSneListSearch(String keyword, int no) {
		Connection conn = getConnection();
		
		ArrayList<Product> list = null;
		
		
			list = new ProductDAO().selectSneListSearch(conn,keyword,no);

			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		close(conn);
		return list;
	}

	public ArrayList<Product> selectAllPoSortList(int i) {
		Connection conn = getConnection();
		
		ArrayList<Product> list = null;
		
		
			list = new ProductDAO().selectAllPoSortList(conn);

			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		close(conn);
		return list;
	}

	public ArrayList<Product> selectAllNewSortList(int i) {
		Connection conn = getConnection();
		
		ArrayList<Product> list = null;
		
		
			list = new ProductDAO().selectAllNewSortList(conn);

			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		close(conn);
		return list;
	}

	public ArrayList<Product> selectAllLowSortList(int i) {
		Connection conn = getConnection();
		
		ArrayList<Product> list = null;
		
		
			list = new ProductDAO().selectAllLowSortList(conn);

			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		close(conn);
		return list;
	}

	public ArrayList<Product> selectAllHighSortList(int i) {
		Connection conn = getConnection();
		
		ArrayList<Product> list = null;
		
		
			list = new ProductDAO().selectAllHighSortList(conn);

			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		close(conn);
		return list;
	}

	public ArrayList<Product> selectRankSortList(String str) {
		Connection conn = getConnection();
		
		ArrayList<Product> list = null;
			list = new ProductDAO().selectRankSortList(conn,str);
			
			if(list != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
		close(conn);
		return list;
	}

	public Product selectProduct2(int pno, int posize) {
		Connection conn = getConnection();
		Product p = new ProductDAO().selectProduct2(conn, pno, posize);
		close(conn);
		return p;
	}

	public ArrayList<ProductOption> selectOption(int pNo) {
      Connection conn = getConnection();
      
      ProductDAO dao = new ProductDAO();
      
      
      ArrayList<ProductOption>  option =  dao.selectOption(conn, pNo);
      
      
      close(conn);
      
      return option;
   }

	public int selectInventory(int i, int j) {
		Connection conn = getConnection();
		int result = new ProductDAO().selectInventory(conn, i, j);
		close(conn);
		return result;
	}

	public void updateInventry(int pono, int i) {
		Connection conn = getConnection();
		int result = new ProductDAO().updateInventry(conn, pono, i);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
	}


	

	

	

}
