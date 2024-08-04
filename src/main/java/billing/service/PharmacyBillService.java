package billing.service;

import billing.dto.PharmacyBillDto;
import billing.pageResponse.PharmacyBillResponse;

import java.util.List;

public interface PharmacyBillService {

    PharmacyBillDto add(List<Long> medId, Long patientId, Long orgId, Long appUserId, PharmacyBillDto pharmacyBillDto);

    PharmacyBillDto getById(Long id);

    PharmacyBillResponse getAll(int pageNo, int pageSize, String sortBy);

    PharmacyBillResponse getAllByOrgId(int pageNo, int pageSize, String sortBy, Long orgId);

    PharmacyBillResponse getAllByOrgAndUserId(int pageNo, int pageSize, String sortBy, Long orgId, Long userId);

    PharmacyBillResponse search(int pageNo, int pageSize, String sortBy, Long orgId, String query);
}
