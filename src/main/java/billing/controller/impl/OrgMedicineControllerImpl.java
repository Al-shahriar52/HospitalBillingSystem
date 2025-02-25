package billing.controller.impl;

import billing.controller.OrgMedicineController;
import billing.dto.OrgMedicineDto;
import billing.service.OrgMedicineService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/org-medicine")
@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ORG_ADMIN')")
public class OrgMedicineControllerImpl implements OrgMedicineController {

    private final OrgMedicineService orgMedicineService;

    public OrgMedicineControllerImpl(OrgMedicineService orgMedicineService) {
        this.orgMedicineService = orgMedicineService;
    }

    @PreAuthorize("hasAnyRole('ROLE_ORG_ADMIN')")
    @PostMapping("/add/organization/{orgId}/medicine/{medicineId}")
    public ResponseEntity<?> add(@PathVariable Long orgId, @PathVariable Long medicineId) {
        return ResponseEntity.ok(orgMedicineService.add(orgId, medicineId));
    }

    @Override
    @PreAuthorize("hasAnyRole('ROLE_ORG_ADMIN')")
    @PostMapping("/add")
    public ResponseEntity<?> addAll(@RequestBody @Valid List<OrgMedicineDto> orgMedicineDtoList) throws Exception {
        return ResponseEntity.ok(orgMedicineService.addAll(orgMedicineDtoList));
    }

    @Override
    @GetMapping("get/{id}")
    public ResponseEntity<?> getById(@PathVariable Long id) {
        return ResponseEntity.ok(orgMedicineService.get(id));
    }

    @Override
    @GetMapping("/get/organization/{orgId}/all")
    public ResponseEntity<?> getAll(@PathVariable Long orgId,
                                    @RequestParam(defaultValue = "0") short page,
                                    @RequestParam(defaultValue = "10") byte size,
                                    @RequestParam(defaultValue = "medicine.name") String sortBy) {
        return ResponseEntity.ok(orgMedicineService.getAll(orgId, page, size, sortBy));
    }

    @Override
    @PreAuthorize("hasAnyRole('ROLE_ORG_ADMIN')")
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        return ResponseEntity.ok(orgMedicineService.delete(id));
    }

    @Override
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ORG_ADMIN', 'ROLE_PHARMACIST')")
    @GetMapping("/organization/{orgId}/search")
    public ResponseEntity<?> search(@PathVariable Long orgId,
                                    @RequestParam(defaultValue = "") String query,
                                    @RequestParam(defaultValue = "medicine.name") String sortBy,
                                    @RequestParam(defaultValue = "0") short page,
                                    @RequestParam(defaultValue = "10") byte size) {
        return ResponseEntity.ok(orgMedicineService.search(orgId, query, page, sortBy, size));
    }
}

