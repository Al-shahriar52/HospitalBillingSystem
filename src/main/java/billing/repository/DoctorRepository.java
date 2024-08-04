package billing.repository;

import billing.entity.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DoctorRepository extends JpaRepository<Doctor,Long> {
    Page<Doctor> getAllDoctorByAppUserId(Pageable pageable, Long appUserId);

    @Query(value = "SELECT *  FROM  doctor d  WHERE " +
            "d.name LIKE CONCAT('%',:query, '%')" +
            "or d.bmdc LIKE CONCAT('%',:query, '%')" ,nativeQuery = true)
    Page<Doctor> searchDoctor(Pageable pageable, String query);

    Boolean existsByBmdcAndDoctorType(Long bmdc, DoctorType doctorType);

    @Query(value = "SELECT * FROM doctor d WHERE d.name LIKE CONCAT('%',:query, '%') and " +
            "NOT d.id IN (SELECT d.id FROM doctor d, org_doctor od " +
            "WHERE d.id = od.doctor_id " +
            "and od.organization_id=:orgId)",nativeQuery = true)
    Page<Doctor> searchOrgDoctor(Pageable pageable, Long orgId, String query);
}
