package billing.controller.impl;

import billing.controller.DoctorController;
import billing.dto.DoctorDto;
import billing.pageResponse.DoctorResponse;
import billing.service.DoctorService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.sql.SQLIntegrityConstraintViolationException;

@RestController
@AllArgsConstructor
@RequestMapping("/doctor")
@PreAuthorize("hasRole('ADMIN')")
public class DoctorControllerImpl implements DoctorController {

    private DoctorService doctorService;

    @PostMapping("/admin/{appUserId}/add")
    @PreAuthorize("hasRole('ADMIN')")
    @Override
    public ResponseEntity<DoctorDto> saveByAdmin(@PathVariable Long appUserId,
                                                 @Valid  @RequestBody DoctorDto doctorDto) throws SQLIntegrityConstraintViolationException {

        return new ResponseEntity<>(doctorService.saveDoctorByadmin(appUserId, doctorDto), HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    @Override
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN')")
    public ResponseEntity<DoctorDto> getById(@PathVariable Long id) {

        return ResponseEntity.ok(doctorService.getDoctorById(id));
    }

    @GetMapping("/all")
    @PreAuthorize("hasRole('ADMIN')")
    @Override
    public ResponseEntity<DoctorResponse> getAll(@RequestParam(defaultValue = "0") int pageNo,
                                                 @RequestParam(defaultValue = "10") int pageSize,
                                                 @RequestParam(defaultValue = "id") String sortBy) {

        return ResponseEntity.ok(doctorService.getAllDoctor(pageNo, pageSize, sortBy));
    }

    @GetMapping("/admin/{appUserId}/all")
    @PreAuthorize("hasRole('ADMIN')")
    @Override
    public ResponseEntity<DoctorResponse> getAllByAppUserId(@RequestParam(defaultValue = "0") int pageNo,
                                                            @RequestParam(defaultValue = "10") int pageSize,
                                                            @RequestParam(defaultValue = "id") String sortBy,
                                                            @PathVariable Long appUserId) {

        return ResponseEntity.ok(doctorService.getAllDoctorByAppUserId(pageNo, pageSize, sortBy, appUserId));
    }

    @PutMapping("/update/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    @Override
    public ResponseEntity<DoctorDto> update(@Valid @RequestBody DoctorDto doctorDto, @PathVariable Long id) {

        DoctorDto responseDoctor = doctorService.updateById(doctorDto,id);
        return new  ResponseEntity<>(responseDoctor, HttpStatus.OK);
    }

    @GetMapping("/search")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN')")
    @Override
    public ResponseEntity<DoctorResponse> searchDoctor(@RequestParam(defaultValue = "0") int pageNo,
                                                       @RequestParam(defaultValue = "10") int pageSize,
                                                       @RequestParam(defaultValue = "id") String sortBy,
                                                       @RequestParam(defaultValue = "") String query) {

        return ResponseEntity.ok(doctorService.searchDoctor(pageNo, pageSize, sortBy, query));
    }

    @GetMapping("/org/{orgId}/search")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN')")
    @Override
    public ResponseEntity<DoctorResponse> searchNotExistOrgDoctor(@RequestParam(defaultValue = "0") int pageNo,
                                                                  @RequestParam(defaultValue = "10") int pageSize,
                                                                  @RequestParam(defaultValue = "id") String sortBy,
                                                                  @PathVariable Long orgId,
                                                                  @RequestParam(defaultValue = "") String query) {

        return ResponseEntity.ok(doctorService.searchOrgDoctor(pageNo, pageSize, sortBy, orgId, query));
    }
}
