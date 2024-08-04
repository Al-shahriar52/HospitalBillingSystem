package billing.controller;

import billing.dto.DoctorDto;
import billing.pageResponse.DoctorResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

public interface DoctorController {
    ResponseEntity<DoctorDto> saveByAdmin(Long appUserId, DoctorDto doctorDto) throws SQLIntegrityConstraintViolationException;

    ResponseEntity<DoctorDto> getById(Long id);

    ResponseEntity<DoctorResponse> getAll(int pageNo, int pageSize, String sortBy);

    ResponseEntity<DoctorResponse> getAllByAppUserId(int pageNo, int pageSize, String sortBy, Long appUserId);

    ResponseEntity<DoctorDto> update(DoctorDto doctorDto, Long id);

    ResponseEntity<DoctorResponse> searchDoctor(int pageNo, int pageSize, String sortBy, String query);

    ResponseEntity<DoctorResponse> searchNotExistOrgDoctor(int pageNo, int pageSize, String sortBy, Long orgId, String query);
}
