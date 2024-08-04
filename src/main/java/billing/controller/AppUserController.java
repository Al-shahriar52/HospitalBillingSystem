package billing.controller;

import billing.dto.AppUserDto;
import billing.entity.AppUser;
import billing.pageResponse.AppUserResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

public interface AppUserController {

    ResponseEntity<AppUserDto> add(Long orgId, AppUserDto appUserDto);

    ResponseEntity<AppUserResponse> getAll(int pageNo, int pageSize, String sortBy);

    ResponseEntity<AppUserDto> getById(Long id);

    ResponseEntity<AppUserResponse> getAllByOrgId(int pageNo, int pageSize, String sortBy, Long orgId);

    ResponseEntity<AppUserDto> update(AppUserDto instructorDto, Long id);

    ResponseEntity<String> delete(Long id);

    ResponseEntity<AppUserResponse> searchEmployee(int pageNo, int pageSize, String sortBy, String query);

    ResponseEntity<AppUserResponse> searchOrgEmployee(int pageNo, int pageSize, String sortBy, Long orgId, String query);

    @GetMapping("/get/info")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN','DOCTOR_RECEPTIONIST','DIAGNOSTIC_RECEPTIONIST','PHARMACIST')")
    ResponseEntity<Optional<AppUser>> getUserDetailsByToken (HttpServletRequest httpServletRequest);
}
