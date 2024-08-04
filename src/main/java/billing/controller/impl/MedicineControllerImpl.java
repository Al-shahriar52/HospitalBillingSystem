package billing.controller.impl;

import billing.controller.MedicineController;
import billing.dto.MedicineDto;
import billing.exceptionHandling.ErrorDetails;
import billing.service.MedicineService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
@RequestMapping("/medicine")
public class MedicineControllerImpl implements MedicineController {
    private final MedicineService medicineService;

    public MedicineControllerImpl(MedicineService medicineService) {
        this.medicineService = medicineService;
    }

    @Override
    @PostMapping("add")
    public ResponseEntity<?> add(@RequestBody @Valid MedicineDto medicineDto) {
        MedicineDto savedMedicineDto = medicineService.add(medicineDto);
        if (savedMedicineDto != null) {
            return new ResponseEntity<>(savedMedicineDto, HttpStatus.CREATED);
        } else return new ResponseEntity<>(new ErrorDetails("Medicine already Exists"), HttpStatus.CONFLICT);
    }

    @Override
    @GetMapping("get/{id}")
    public ResponseEntity<?> getById(@PathVariable Long id) {

        return ResponseEntity.ok(medicineService.get(id));
    }

    @Override
    @GetMapping("search")
    public ResponseEntity<?> search(@RequestParam(defaultValue = "") String query,
                                    @RequestParam(defaultValue = "0") short page,
                                    @RequestParam(defaultValue = "name") String sortBy,
                                    @RequestParam(defaultValue = "10") byte size) {
        return ResponseEntity.ok(medicineService.search(query, page, sortBy, size));
    }

    @Override
    @GetMapping("get/all")
    public ResponseEntity<?> getAllByPagination(@RequestParam(defaultValue = "0") short page,
                                                @RequestParam(defaultValue = "name") String sortBy,
                                                @RequestParam(defaultValue = "10") byte size) {
        return ResponseEntity.ok(medicineService.getAll(page, sortBy, size));
    }


    @Override
    @PutMapping("update")
    public ResponseEntity<?> update(@RequestBody @Valid MedicineDto medicineDto) {
        return ResponseEntity.ok(medicineService.update(medicineDto));
    }

    @Override
    @PreAuthorize("hasAnyRole('ROLE_ORG_ADMIN')")
    @GetMapping("get/all/{orgId}")
    public ResponseEntity<?> findMedicineNotInOrganization(
            @PathVariable Long orgId,
            @RequestParam(defaultValue = "") String query,
            @RequestParam(defaultValue = "0") short page,
            @RequestParam(defaultValue = "name") String sortBy,
            @RequestParam(defaultValue = "10") byte size
    ) {
        return ResponseEntity.ok(medicineService.findMedicineNotInOrganization(orgId, query, page, sortBy, size));
    }
}
