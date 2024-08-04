package billing.controller;

import billing.dto.MedicineDto;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;


@RequestMapping("/medicine")
public interface MedicineController {

    @PostMapping("add")
    ResponseEntity<?> add(@RequestBody MedicineDto medicineDto);

    @GetMapping("get/{id}")
    ResponseEntity<?> getById(@PathVariable Long id);

    @GetMapping("search")
    ResponseEntity<?> search(
            @RequestParam(defaultValue = "") String query,
            @RequestParam(defaultValue = "0") short page,
            @RequestParam(defaultValue = "serviceName") String sortBy,
            @RequestParam(defaultValue = "10") byte size);

    @GetMapping("get/all")
    ResponseEntity<?> getAllByPagination(@RequestParam(defaultValue = "0") short page,
                                         @RequestParam(defaultValue = "serviceName") String sortBy,
                                         @RequestParam(defaultValue = "10") byte size);


    @PutMapping("update")
    ResponseEntity<?> update(@RequestBody MedicineDto medicineDto);


    @PreAuthorize("hasAnyRole('ROLE_ORG_ADMIN')")
    @GetMapping("get/all/{orgId}")
    ResponseEntity<?> findMedicineNotInOrganization(
            @PathVariable Long orgId,
            @RequestParam(defaultValue = "") String query,
            @RequestParam(defaultValue = "0") short page,
            @RequestParam(defaultValue = "name") String sortBy,
            @RequestParam(defaultValue = "10") byte size
    );
}
