package billing.controller.impl;

import billing.controller.DrAppointmentBillController;
import billing.dto.DrAppointmentBillDto;
import billing.pageResponse.AppointmentResponse;
import billing.service.DrAppointmentService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/appointmentBill")
@PreAuthorize("hasRole('ADMIN')")
public class DrAppointmentBillControllerImpl implements DrAppointmentBillController {

    private final DrAppointmentService drAppointmentService;
    @Override
    @PostMapping("/appuser/{appUserId}/orgDoc/{orgDrId}/patient/{patientId}/org/{orgId}/add")
    @PreAuthorize("hasRole('DOCTOR_RECEPTIONIST')")
    public ResponseEntity<DrAppointmentBillDto> add(@PathVariable Long appUserId,
                                                    @PathVariable Long orgDrId,
                                                    @PathVariable Long patientId,
                                                    @PathVariable Long orgId,
                                                    @RequestBody DrAppointmentBillDto drAppointmentBillDto) {

        return new ResponseEntity<>(drAppointmentService.add(appUserId, orgDrId, patientId, orgId, drAppointmentBillDto), HttpStatus.CREATED);
    }

    @GetMapping("/get/{apptId}")
    @PreAuthorize("hasAnyRole('ADMIN', 'ORG_ADMIN','DOCTOR_RECEPTIONIST')")
    @Override
    public ResponseEntity<DrAppointmentBillDto> getById(@PathVariable Long apptId) {

        return ResponseEntity.ok(drAppointmentService.getById(apptId));
    }

    @GetMapping("/all")
    @PreAuthorize("hasAnyRole('ADMIN', 'ORG_ADMIN','DOCTOR_RECEPTIONIST')")
    @Override
    public ResponseEntity<AppointmentResponse> getAll(@RequestParam(defaultValue = "0") int pageNo,
                                                      @RequestParam(defaultValue = "10") int pageSize,
                                                      @RequestParam(defaultValue = "id") String sortBy
    ) {
        return  ResponseEntity.ok(drAppointmentService.getAll(pageNo, pageSize, sortBy));
    }

    @GetMapping("/get/org/{orgId}/all")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN','DOCTOR_RECEPTIONIST')")
    @Override
    public ResponseEntity<AppointmentResponse> getAllByOrgId (@RequestParam(defaultValue = "0") int pageNo,
                                                              @RequestParam(defaultValue = "10") int pageSize,
                                                              @RequestParam( defaultValue = "id") String sortBy,
                                                              @PathVariable Long orgId) {

        return ResponseEntity.ok(drAppointmentService.getAllByOrgId(pageNo, pageSize, sortBy, orgId));
    }

    @GetMapping("/get/org/{orgId}/user/{userId}/all")
    @PreAuthorize("hasAnyRole('ORG_ADMIN','DOCTOR_RECEPTIONIST')")
    @Override
    public ResponseEntity<AppointmentResponse> getAllByOrgAndUserId (@RequestParam(defaultValue = "0") int pageNo,
                                                                     @RequestParam(defaultValue = "10") int pageSize,
                                                                     @RequestParam(defaultValue = "id") String sortBy,
                                                                     @PathVariable Long orgId,
                                                                     @PathVariable Long userId) {

        return ResponseEntity.ok(drAppointmentService.getAllByOrgAndUserId(pageNo, pageSize, sortBy, orgId, userId));
    }

    @GetMapping("/get/org/{orgId}/orgDr/{orgDrId}/all")
    @PreAuthorize("hasAnyRole('ORG_ADMIN','DOCTOR_RECEPTIONIST')")
    @Override
    public ResponseEntity<AppointmentResponse> getAllByOrgAndOrgDrId (@RequestParam(defaultValue = "0") int pageNo,
                                                                      @RequestParam(defaultValue = "10") int pageSize,
                                                                      @RequestParam(defaultValue = "id") String sortBy,
                                                                      @PathVariable Long orgId,
                                                                      @PathVariable Long orgDrId) {

        return ResponseEntity.ok(drAppointmentService.getAllByOrgAndOrgDr(pageNo, pageSize, sortBy, orgId, orgDrId));
    }

    @GetMapping("/org/{orgId}/search")
    @PreAuthorize("hasAnyRole('ORG_ADMIN','DOCTOR_RECEPTIONIST','ADMIN')")
    @Override
    public ResponseEntity<AppointmentResponse> search(@RequestParam(defaultValue = "0") int pageNo,
                                                      @RequestParam(defaultValue = "10") int pageSize,
                                                      @RequestParam(defaultValue = "id") String sortBy,
                                                      @PathVariable Long orgId,
                                                      @RequestParam(defaultValue = "") String query) {
        return ResponseEntity.ok(drAppointmentService.search(pageNo, pageSize, sortBy, orgId, query));
    }

}
