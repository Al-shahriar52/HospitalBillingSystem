package billing.repository;

import billing.entity.PharmacyBill;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PharmacyBillRepository extends JpaRepository<PharmacyBill,Long> {

    Page<PharmacyBill> findAllByOrganizationId(Pageable pageable, Long orgId);

    Page<PharmacyBill> findAllByOrganizationIdAndCreatedById(Pageable pageable, Long orgId, Long userId);

    @Query(value = "select pb from PharmacyBill pb where pb.organization.id=:orgId " +
            "and (pb.patient.phone like concat('%',:query,'%') "+
            "or pb.createdBy.name like concat('%',:query,'%') )")
    Page<PharmacyBill> search(Pageable pageable, Long orgId, String query);


    @Query("SELECT SUM(pb.finalBill) FROM PharmacyBill pb where pb.organization.id = :orgId")
    Double totalRevenueOfOrg(Long orgId);

    @Query("SELECT SUM(pb.finalBill) FROM PharmacyBill pb")
    Double totalRevenue();
}
