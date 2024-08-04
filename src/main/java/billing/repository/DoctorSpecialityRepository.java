package billing.repository;

import billing.entity.Doctor;
import billing.entity.DoctorSpeciality;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DoctorSpecialityRepository extends JpaRepository<DoctorSpeciality,Long> {

    @Query(value = "SELECT *  FROM  doctor d join doctor_speciality ds  on (d.id = ds.doctor_id) WHERE " +
            "d.name LIKE CONCAT('%',:query, '%')" +
            "or d.bmdc LIKE CONCAT('%',:query, '%')" +
            "or ds.name LIKE CONCAT('%', :query, '%')",nativeQuery = true)
    Page<Doctor> searchDoctor(Pageable pageable, String query);
}
