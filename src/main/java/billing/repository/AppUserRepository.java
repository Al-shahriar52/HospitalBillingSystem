package billing.repository;

import billing.entity.AppUser;
import billing.entity.Role;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AppUserRepository extends JpaRepository<AppUser,Long> {

    @Query(value = "SELECT * FROM app_user u  WHERE " +
            "u.name LIKE CONCAT('%',:query, '%') "+
            "or u.phone like CONCAT('%',:query, '%')",nativeQuery = true)
    Page<AppUser> searchEmployee(Pageable pageable, String query);

    @Query(value = "SELECT * FROM app_user u WHERE " +
            "u.name LIKE CONCAT('%',:query, '%')" +
            "and u.organization_id =:orgId ",nativeQuery = true)
    Page<AppUser> searchOrgEmployee(Pageable pageable, Long orgId, String query);

    Long countAppUserByOrganizationId(Long orgId);

    Page<AppUser> getAllByOrganizationId(Pageable pageable, Long orgId);

    Optional<AppUser> findByEmail(String email);

    Optional<AppUser> findByEmailOrPhone(String email, String phone);

    Optional<Role> findByRole(String role);

    Boolean existsByEmail(String email);
}
