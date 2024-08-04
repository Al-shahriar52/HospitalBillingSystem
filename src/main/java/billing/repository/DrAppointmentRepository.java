package billing.repository;

import billing.entity.DrAppointmentBill;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DrAppointmentRepository extends JpaRepository<DrAppointmentBill,Long> {

    Page<DrAppointmentBill> findAllDrAppointmentBillByOrganizationId(Pageable pageable, Long orgId);

    Page<DrAppointmentBill> findAllDrAppointmentBillByOrganizationIdAndCreatedById(Pageable pageable, Long orgId, Long createdById);

    Page<DrAppointmentBill> findAllByOrganizationIdAndOrgDoctorId(Pageable pageable, Long orgId, Long orgDoctorId);

    @Query(value = "select ab from DrAppointmentBill ab where ab.organization.id=:orgId "+
    "and (ab.patient.phone like concat('%',:query,'%') " +
    "or ab.orgDoctor.doctor.name like concat('%', :query, '%') )")
    Page<DrAppointmentBill> search(Pageable pageable , Long orgId, String query);

    @Query("SELECT SUM(dab.finalFee) FROM DrAppointmentBill dab where dab.organization.id = :orgId")
    Double totalRevenueOfOrg(Long orgId);

    @Query("SELECT SUM(dab.finalFee) FROM DrAppointmentBill dab")
    Double totalRevenue();
}
