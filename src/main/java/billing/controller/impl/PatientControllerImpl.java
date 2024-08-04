package billing.controller.impl;

import billing.controller.PatientController;
import billing.dto.PatientDto;
import billing.service.PatientService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_ORG_ADMIN','ROLE_DOCTOR_RECEPTIONIST'," +
        "'ROLE_DIAGNOSTIC_RECEPTIONIST'," +
        "'ROLE_PHARMACIST')")
@RequestMapping("/patient")
public class PatientControllerImpl implements PatientController {
    private final PatientService patientService;

    public PatientControllerImpl(PatientService patientService) {
        this.patientService = patientService;
    }

    @Override
    @PostMapping("add")
    public ResponseEntity<?> add(@RequestBody @Valid PatientDto patientDto) {
        return ResponseEntity.ok(patientService.add(patientDto));
    }

    @Override
    @GetMapping("get/{id}")
    public ResponseEntity<?> getById(@PathVariable Long id) {

        return ResponseEntity.ok(patientService.get(id));
    }

    @Override
    @GetMapping("get/all")
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(patientService.getAll());
    }

    @Override
    @PreAuthorize("hasRole('Nobody')")
    @DeleteMapping("delete/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        return ResponseEntity.ok(patientService.delete(id));
    }

    @Override
    @PutMapping("update")
    public ResponseEntity<?> update(@RequestBody @Valid PatientDto patientDto) {
        return ResponseEntity.ok(patientService.update(patientDto));
    }

    @Override
    @GetMapping("search")
    public ResponseEntity<?> search(@RequestParam(defaultValue = "") String query,
                                    @RequestParam(defaultValue = "name") String sortBy,
                                    @RequestParam(defaultValue = "0") short page,
                                    @RequestParam(defaultValue = "10") byte size) {
        return ResponseEntity.ok(patientService.search(query, page, sortBy, size));
    }
}
