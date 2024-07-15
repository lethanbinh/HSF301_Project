package hsf301.fe.com.repository;

import hsf301.fe.com.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    User findById (int userId);
    User findByUsername (String username);
    User findByEmailAndPassword (String email, String password);
}
