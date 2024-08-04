package billing.controller.impl;

import billing.controller.OrgDoctorController;
import billing.dto.OrgDoctorDto;
import billing.pageResponse.OrgDoctorResponse;
import billing.service.DoctorService;
import billing.service.OrgDoctorService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@AllArgsConstructor
@RequestMapping("/orgDoctor")
@PreAuthorize("hasRole('ADMIN')")
public class OrgDoctorControllerImpl implements OrgDoctorController {

    private final OrgDoctorService orgDoctorService;
    private final DoctorService doctorService;
    @PostMapping("/appuser/{appUserId}/org/{orgId}/doctor/{doctorId}/add")
    @PreAuthorize("hasRole('ORG_ADMIN')")
    @Override
    public ResponseEntity<OrgDoctorDto> add(@PathVariable Long appUserId,
                                            @PathVariable Long orgId,
                                            @PathVariable Long doctorId,
                                            @Valid @RequestBody OrgDoctorDto orgDoctorDto) {
        return new ResponseEntity<>(orgDoctorService.add(appUserId, orgId, doctorId, orgDoctorDto), HttpStatus.CREATED);
    }
    @GetMapping("/get/{id}")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN')")
    @Override
    public ResponseEntity<OrgDoctorDto> getById(@PathVariable Long id) {
        return ResponseEntity.ok(orgDoctorService.getById(id));
    }

    @GetMapping("/all")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN')")
    @Override
    public ResponseEntity<OrgDoctorResponse> getAll(@RequestParam(defaultValue = "0") int pageNo,
                                                    @RequestParam(defaultValue = "10") int pageSize,
                                                    @RequestParam(defaultValue = "id") String sortBy) {

        return ResponseEntity.ok(orgDoctorService.getAll(pageNo, pageSize, sortBy));
    }

    @GetMapping("/appUser/{appUserId}/organization/{orgId}/all")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN')")
    @Override
    public ResponseEntity<OrgDoctorResponse> getAllByAppUserAndOrgId(@RequestParam(defaultValue = "0") int pageNo,
                                                                     @RequestParam(defaultValue = "10") int pageSize,
                                                                     @RequestParam(defaultValue = "id") String sortBy,
                                                                     @PathVariable Long appUserId,
                                                                     @PathVariable Long orgId) {

        return ResponseEntity.ok(orgDoctorService.getAllByAppUserOrgId(pageNo, pageSize, sortBy, appUserId, orgId));
    }

    @GetMapping("/organization/{orgId}/all")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN')")
    @Override
    public ResponseEntity<OrgDoctorResponse> getAllByOrgId(@RequestParam(defaultValue = "0") int pageNo,
                                                           @RequestParam(defaultValue = "10") int pageSize,
                                                           @RequestParam(defaultValue = "id") String sortBy,
                                                           @PathVariable Long orgId) {

        return ResponseEntity.ok(orgDoctorService.getAllByOrgId(pageNo, pageSize, sortBy, orgId));
    }

    @PutMapping("/update/{id}")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN')")
    @Override
    public ResponseEntity<OrgDoctorDto> update(@Valid @RequestBody OrgDoctorDto orgDoctorDto,
                                               @PathVariable Long id) {

        OrgDoctorDto response = orgDoctorService.updateById(orgDoctorDto, id);
        return new  ResponseEntity<>(response,HttpStatus.OK);
    }

    @GetMapping("/org/{orgId}/search")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN','DOCTOR_RECEPTIONIST')")
    @Override
    public ResponseEntity<OrgDoctorResponse> searchOrgDoctor(@RequestParam(defaultValue = "0") int pageNo,
                                                             @RequestParam(defaultValue = "10") int pageSize,
                                                             @RequestParam(defaultValue = "id") String sortBy,
                                                             @PathVariable Long orgId,
                                                             @RequestParam(defaultValue = "") String query) {

        return ResponseEntity.ok(orgDoctorService.searchOrgDoctor(pageNo, pageSize,sortBy,orgId, query));
    }
}
