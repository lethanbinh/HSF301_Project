package hsf301.fe.com.repository.custom;

import hsf301.fe.com.dto.ProductSearchRequestDTO;
import hsf301.fe.com.pojo.Product;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class ProductRepositoryCustomImpl implements ProductRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    public void queryWhere(StringBuilder where, ProductSearchRequestDTO productSearchRequestDTO) {
        if(productSearchRequestDTO.getName() != null && !"".equals(productSearchRequestDTO.getName())) {
            where.append(" AND name LIKE '%" + productSearchRequestDTO.getName() + "%' ");
        }
        if(productSearchRequestDTO.getRange() != null && productSearchRequestDTO.getRange() != 0) {
            where.append(" AND price <= " + productSearchRequestDTO.getRange() );
        }
        if(productSearchRequestDTO.getCategoryList() != null && !productSearchRequestDTO.getCategoryList().isEmpty()){
            List<String> categoryList = productSearchRequestDTO.getCategoryList();
            where.append(" AND (");
            String sqlJoin = categoryList.stream().map(item-> "products.category LIKE '%" + item + "%'").collect(Collectors.joining(" OR "));
            where.append(sqlJoin + ")");
        }
    }
    public void queryJoin(StringBuilder sql, ProductSearchRequestDTO productSearchRequestDTO) {
        // join if user id exists
        if(productSearchRequestDTO.getSort() != null && productSearchRequestDTO.getSort().equals("Popularity")) {
            sql.append(" LEFT JOIN order_items ON products.id = order_items.product_id ");
        }
        /*
        SELECT products.*, SUM(order_items.quantity)
        FROM products
        LEFT JOIN order_items ON products.id = order_items.product_id
        WHERE ...
        GROUP BY products.id
        ORDER BY SUM(order_items.quantity) DESC;
        */
    }
    @Override
    public List<Product> findAllCustom(ProductSearchRequestDTO productSearchRequestDTO) {
        // sql
        StringBuilder sql = new StringBuilder("SELECT products.* FROM products ") ;
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");
        StringBuilder groupBy = new StringBuilder(" GROUP BY products.id ");
        StringBuilder orderBy = new StringBuilder("");

        // Kiểm tra trạng thái sản phẩm là true
        where.append(" AND products.status = true ");

        if( productSearchRequestDTO.getSort() != null && productSearchRequestDTO.getSort().equals("Popularity")) {
            orderBy.append(" ORDER BY SUM(order_items.quantity) DESC ");
        }

        //where conditions
        queryJoin(sql, productSearchRequestDTO);
        queryWhere(where, productSearchRequestDTO);
        sql.append(where) ;
        sql.append(groupBy) ;
        sql.append(orderBy) ;
        System.out.println(sql);
        Query query = entityManager.createNativeQuery(sql.toString(), Product.class);
        return query.getResultList();
    }
}
