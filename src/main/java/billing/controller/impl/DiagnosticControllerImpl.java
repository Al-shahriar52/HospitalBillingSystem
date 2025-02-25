package billing.controller.impl;

import billing.controller.DiagnosticController;
import billing.dto.DiagnosticDto;
import billing.service.DiagnosticService;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
@RequestMapping("/diagnostic")
public class DiagnosticControllerImpl implements DiagnosticController {
    private final DiagnosticService diagnosticService;

    public DiagnosticControllerImpl(DiagnosticService diagnosticService) {
        this.diagnosticService = diagnosticService;
    }

    @Override
    @PostMapping("add")
    public ResponseEntity<?> add(@RequestBody @Valid DiagnosticDto diagnosticDto) {
        DiagnosticDto savedDiagnosticDto = diagnosticService.add(diagnosticDto);
        if (savedDiagnosticDto != null) {
            return new ResponseEntity<>(savedDiagnosticDto, HttpStatus.CREATED);
        } else throw new DuplicateKeyException("Diagnostic Service already exists in the database!");
    }

    @Override
    @PostMapping("add/all")
    public ResponseEntity<?> addAll(@RequestBody @Valid List<DiagnosticDto> diagnosticDtoList) {
        return new ResponseEntity<>(diagnosticService.addAll(diagnosticDtoList), HttpStatus.CREATED);
    }

    @Override
    @GetMapping("get/{id}")
    public ResponseEntity<?> getById(@PathVariable Long id) {
        return ResponseEntity.ok(diagnosticService.get(id));
    }

    @Override
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ORG_ADMIN')")
    @GetMapping("search")
    public ResponseEntity<?> search(
            @RequestParam(defaultValue = "") String query,
            @RequestParam(defaultValue = "0") short page,
            @RequestParam(defaultValue = "serviceName") String sortBy,
            @RequestParam(defaultValue = "10") byte size) {
        return ResponseEntity.ok(diagnosticService.search(query, page, sortBy, size));
    }

    @Override
    @GetMapping("get/all")
    public ResponseEntity<?> getAllByPagination(@RequestParam(defaultValue = "0") short page,
                                                @RequestParam(defaultValue = "serviceName") String sortBy,
                                                @RequestParam(defaultValue = "10") byte size) {
        return ResponseEntity.ok(diagnosticService.getAll(page, sortBy, size));
    }

    @Override
    @DeleteMapping("delete/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        return ResponseEntity.ok(diagnosticService.delete(id));
    }

    @Override
    @PutMapping("update")
    public ResponseEntity<?> update(@RequestBody @Valid DiagnosticDto diagnosticDto) {
        return ResponseEntity.ok(diagnosticService.update(diagnosticDto));
    }

    @Override
    @PreAuthorize("hasRole('ROLE_ORG_ADMIN')")
    @GetMapping("get/all/{orgId}")
    public ResponseEntity<?> findDiagnosticNotInOrganization(
            @PathVariable Long orgId,
            @RequestParam(defaultValue = "") String query,
            @RequestParam(defaultValue = "0") short page,
            @RequestParam(defaultValue = "service_name") String sortBy,
            @RequestParam(defaultValue = "10") byte size) {

        return ResponseEntity.ok(diagnosticService.findDiagnosticNotInOrganization(orgId, query, page, sortBy, size));
    }
}
