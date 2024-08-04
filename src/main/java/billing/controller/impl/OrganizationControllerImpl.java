package billing.controller.impl;

import billing.controller.OrganizationController;
import billing.dto.OrganizationDto;
import billing.pageResponse.OrganizationResponse;
import billing.service.OrganizationService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@AllArgsConstructor
@RequestMapping("/organization")
@PreAuthorize("hasRole('ADMIN')")
public class OrganizationControllerImpl implements OrganizationController {

    private OrganizationService organizationService;

    @PostMapping("/add")
    @PreAuthorize("hasRole('ADMIN')")
    @Override
    public ResponseEntity<OrganizationDto> add(@Valid @RequestBody OrganizationDto organizationDto) {

        return new ResponseEntity<>(organizationService.add(organizationDto), HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN','DOCTOR_RECEPTIONIST','DIAGNOSTIC_RECEPTIONIST','PHARMACIST')")
    @Override
    public ResponseEntity<OrganizationDto> getById(@PathVariable Long id) {

        return ResponseEntity.ok(organizationService.getOrganizationById(id));
    }

    @GetMapping("/all")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN')")
    @Override
    public ResponseEntity<OrganizationResponse> getAll(@RequestParam(defaultValue = "0") int pageNo,
                                                       @RequestParam(defaultValue = "10") int pageSize,
                                                       @RequestParam(defaultValue = "id") String sortBy) {

        return ResponseEntity.ok(organizationService.getAll(pageNo, pageSize, sortBy));
    }

    @PutMapping("/update/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    @Override
    public ResponseEntity<OrganizationDto> update(@Valid @RequestBody OrganizationDto organizationDto,
                                                  @PathVariable Long id) {

        OrganizationDto responseOrg = organizationService.updateById(organizationDto,id);
        return new  ResponseEntity<>(responseOrg,HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    @Override
    public ResponseEntity<String> delete(@PathVariable Long id) {

        organizationService.deleteById(id);
        return new  ResponseEntity<>("organization deleted", HttpStatus.OK);
    }

    @GetMapping("/search")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN','DOCTOR_RECEPTIONIST','DIAGNOSTIC_RECEPTIONIST','PHARMACIST')")
    @Override
    public ResponseEntity<OrganizationResponse> searchOrganization(@RequestParam(defaultValue = "0") int pageNo,
                                                                   @RequestParam(defaultValue = "10") int pageSize,
                                                                   @RequestParam(defaultValue = "id") String sortBy,
                                                                   @RequestParam(defaultValue = "") String query) {

        return ResponseEntity.ok(organizationService.searchOrganization(pageNo, pageSize, sortBy, query));
    }
}
