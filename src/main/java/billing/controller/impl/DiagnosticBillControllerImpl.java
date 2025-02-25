package billing.controller.impl;

import billing.controller.DiagnosticBillController;
import billing.dto.DiagnosticBillDto;
import billing.service.DiagnosticBillService;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_ORG_ADMIN', 'ROLE_DIAGNOSTIC_RECEPTIONIST')")
@RequestMapping("/diagnostic-bill")
public class DiagnosticBillControllerImpl implements DiagnosticBillController {
    private final DiagnosticBillService diagnosticBillService;
    private final HttpServletRequest httpServletRequest;


    public DiagnosticBillControllerImpl(DiagnosticBillService diagnosticBillService, HttpServletRequest httpServletRequest) {
        this.diagnosticBillService = diagnosticBillService;
        this.httpServletRequest = httpServletRequest;
    }

    @Override
    @PreAuthorize("hasAnyRole('ROLE_ORG_ADMIN', 'ROLE_DIAGNOSTIC_RECEPTIONIST')")
    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestBody @Valid DiagnosticBillDto diagnosticBillDto) {
        return ResponseEntity.ok(diagnosticBillService.add(httpServletRequest, diagnosticBillDto));
    }

    @Override
    @GetMapping("/view/{id}")
    public ResponseEntity<?> view(@PathVariable Long id) {
        return ResponseEntity.ok(diagnosticBillService.viewInvoice(id));
    }

    @Override
    @GetMapping("view/{orgId}/all")
    public Page<?> viewAllofOrg(
            @PathVariable Long orgId,
            @RequestParam(value = "query", defaultValue = "") String query,
            @RequestParam(value = "page", defaultValue = "0") short page,
            @RequestParam(value = "sortBy", defaultValue = "timestamp") String sortBy,
            @RequestParam(value = "sortOrder", defaultValue = "Sort.Direction.DESC") String sortOrder,
            @RequestParam(defaultValue = "10") byte size) {

        return diagnosticBillService.search(orgId, query, page, size, sortBy, sortOrder);
    }

    @Override
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping("view/all")
    public Page<?> viewAll(
            @RequestParam(defaultValue = "0") Long orgId,
            @RequestParam(defaultValue = "") String query,
            @RequestParam(defaultValue = "0") short page,
            @RequestParam(defaultValue = "timestamp") String sortBy,
            @RequestParam(defaultValue = "Sort.Direction.DESC") String sortOrder,
            @RequestParam(defaultValue = "10") byte size) {

        return diagnosticBillService.search(orgId, query, page, size, sortBy, sortOrder);
    }
}
