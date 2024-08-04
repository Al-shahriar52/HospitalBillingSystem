package billing.controller.impl;

import billing.controller.PharmacyBillController;
import billing.dto.PharmacyBillDto;
import billing.pageResponse.PharmacyBillResponse;
import billing.service.PharmacyBillService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/pharmacyBill")
public class PharmacyBillControllerImpl implements PharmacyBillController {

    private final PharmacyBillService pharmacyBillService;
    @Override
    @PostMapping("/med/{medId}/patient/{patientId}/org/{orgId}/appUser/{appUserId}/add")
    @PreAuthorize("hasAnyRole('ADMIN','PHARMACIST')")
    public ResponseEntity<?> add(@PathVariable List<Long> medId,
                                 @PathVariable Long patientId,
                                 @PathVariable Long orgId,
                                 @PathVariable Long appUserId,
                                 @RequestBody PharmacyBillDto pharmacyBillDto) {

        return new ResponseEntity<>(pharmacyBillService.add(medId, patientId, orgId, appUserId, pharmacyBillDto), HttpStatus.CREATED);
    }

    @GetMapping("/get/{id}")
    @PreAuthorize("hasAnyRole('ADMIN','PHARMACIST','ORG_ADMIN')")
    @Override
    public ResponseEntity<PharmacyBillDto> getById(@PathVariable Long id) {

        return ResponseEntity.ok(pharmacyBillService.getById(id));
    }

    @GetMapping("/all")
    @PreAuthorize("hasAnyRole('ADMIN','PHARMACIST','ORG_ADMIN')")
    @Override
    public ResponseEntity<PharmacyBillResponse> getAll(@RequestParam(defaultValue = "0") int pageNo,
                                                       @RequestParam(defaultValue = "10") int pageSize,
                                                       @RequestParam(defaultValue = "id") String sortBy
    ) {
        return  ResponseEntity.ok(pharmacyBillService.getAll(pageNo, pageSize, sortBy));
    }

    @Override
    @GetMapping("/get/org/{orgId}/all")
    @PreAuthorize("hasAnyRole('ADMIN','PHARMACIST','ORG_ADMIN')")
    public ResponseEntity<PharmacyBillResponse> getAllByOrgId(@RequestParam(defaultValue = "0") int pageNo,
                                                              @RequestParam(defaultValue = "10") int pageSize,
                                                              @RequestParam(defaultValue = "id") String sortBy,
                                                              @PathVariable Long orgId) {

        return ResponseEntity.ok(pharmacyBillService.getAllByOrgId(pageNo, pageSize, sortBy, orgId));
    }

    @Override
    @GetMapping("/get/org/{orgId}/appUser/{userId}/all")
    @PreAuthorize("hasAnyRole('ADMIN','PHARMACIST','ORG_ADMIN')")
    public ResponseEntity<PharmacyBillResponse> getAllByOrgAndUserId(@RequestParam(defaultValue = "0") int pageNo,
                                                                     @RequestParam(defaultValue = "10") int pageSize,
                                                                     @RequestParam(defaultValue = "id") String sortBy,
                                                                     @PathVariable Long orgId, @PathVariable Long userId) {

        return ResponseEntity.ok(pharmacyBillService.getAllByOrgAndUserId(pageNo, pageSize, sortBy, orgId, userId));
    }

    @GetMapping("/org/{orgId}/search")
    @PreAuthorize("hasAnyRole('ADMIN','PHARMACIST','ORG_ADMIN')")
    @Override
    public ResponseEntity<PharmacyBillResponse> search(@RequestParam(defaultValue = "0") int pageNo,
                                                       @RequestParam(defaultValue = "10") int pageSize,
                                                       @RequestParam(defaultValue = "id") String sortBy,
                                                       @PathVariable Long orgId,
                                                       @RequestParam(defaultValue = "") String query) {

        return ResponseEntity.ok(pharmacyBillService.search(pageNo, pageSize, sortBy, orgId, query));
    }

}
