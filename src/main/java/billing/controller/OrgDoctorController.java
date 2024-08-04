package billing.controller;

import billing.dto.OrgDoctorDto;
import billing.pageResponse.OrgDoctorResponse;
import org.springframework.http.ResponseEntity;

public interface OrgDoctorController {
    ResponseEntity<OrgDoctorDto> add(Long appUserId, Long orgId, Long doctorId, OrgDoctorDto orgDoctorDto);

    ResponseEntity<OrgDoctorDto> getById(Long id);

    ResponseEntity<OrgDoctorResponse> getAll(int pageNo, int pageSize, String sortBy);

    ResponseEntity<OrgDoctorResponse> getAllByOrgId(int pageNo, int pageSize, String sortBy, Long orgId);

    ResponseEntity<OrgDoctorResponse> getAllByAppUserAndOrgId(int pageNo, int pageSize, String sortBy, Long appUserId, Long orgId);

    ResponseEntity<OrgDoctorDto> update(OrgDoctorDto orgDoctorDto, Long id);

    ResponseEntity<OrgDoctorResponse> searchOrgDoctor(int pageNo, int pageSize, String sortBy, Long orgId, String query);
}
