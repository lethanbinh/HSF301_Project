package hsf301.fe.com.repository;

import hsf301.fe.com.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    User findById (int userId);
    User findByUsername (String username);
    User findByEmailAndPassword (String email, String password);

    @Query("SELECT u FROM User u WHERE u.status = true")
    List<User> listAllUser();

    long countByEmailOrUsernameOrPhone(String email, String username, String phone);
}
