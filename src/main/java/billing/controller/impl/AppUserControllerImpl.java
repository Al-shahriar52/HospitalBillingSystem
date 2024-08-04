package billing.controller.impl;

import billing.controller.AppUserController;
import billing.dto.AppUserDto;
import billing.entity.AppUser;
import billing.pageResponse.AppUserResponse;
import billing.repository.AppUserRepository;
import billing.service.AppUserService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Optional;

@RestController
@AllArgsConstructor
@RequestMapping("/appUser")
@PreAuthorize("hasRole('ADMIN')")
public class AppUserControllerImpl implements AppUserController {

    private final AppUserService appUserService;
    private final AppUserRepository appUserRepository;

    @PostMapping("/org/{orgId}/add")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN')")
    public ResponseEntity<AppUserDto> add(@PathVariable Long orgId,
                                          @Valid @RequestBody AppUserDto appUserDto) {

        return new ResponseEntity<>(appUserService.add(orgId, appUserDto), HttpStatus.CREATED);
    }

    @GetMapping("/get/all")
    @Override
    public ResponseEntity<AppUserResponse> getAll(@RequestParam(defaultValue = "0") int pageNo,
                                                  @RequestParam(defaultValue = "10") int pageSize,
                                                  @RequestParam(defaultValue = "id") String sortBy) {

        return ResponseEntity.ok(appUserService.getAllAppUser(pageNo, pageSize, sortBy));
    }

    @GetMapping("/get/{id}")
    @PreAuthorize("hasAnyRole('ADMIN'," +
            "'ORG_ADMIN'," +
            "'DOCTOR_RECEPTIONIST'," +
            "'DIAGNOSTIC_RECEPTIONIST'," +
            "'PHARMACIST')")
    @Override
    public ResponseEntity<AppUserDto> getById(@PathVariable Long id) {

        return ResponseEntity.ok(appUserService.getAppUserById(id));
    }

    @GetMapping("/organization/{orgId}/all")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN')")
    @Override
    public ResponseEntity<AppUserResponse> getAllByOrgId(@RequestParam(defaultValue = "0") int pageNo,
                                                         @RequestParam(defaultValue = "10") int pageSize,
                                                         @RequestParam(defaultValue = "id") String sortBy,
                                                         @PathVariable Long orgId) {

        return ResponseEntity.ok(appUserService.getAllByOrgId(pageNo, pageSize, sortBy, orgId));
    }

    @PutMapping("update/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'ORG_ADMIN')")
    @Override
    public ResponseEntity<AppUserDto> update(@Valid @RequestBody AppUserDto instructorDto, @PathVariable Long id) {

        AppUserDto responseInstructor = appUserService.updateAppUserById(instructorDto,id);
        return new  ResponseEntity<>(responseInstructor, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    @Override
    public ResponseEntity<String> delete(@PathVariable Long id) {

        appUserService.deleteAppUserById(id);
        return new  ResponseEntity<>("App user deleted", HttpStatus.OK);
    }

    @GetMapping("/search")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN')")
    @Override
    public ResponseEntity<AppUserResponse> searchEmployee(@RequestParam(defaultValue = "0") int pageNo,
                                                          @RequestParam(defaultValue = "10") int pageSize,
                                                          @RequestParam(defaultValue = "id") String sortBy,
                                                          @RequestParam(defaultValue = "") String query) {

        return ResponseEntity.ok(appUserService.searchEmployee(pageNo, pageSize, sortBy, query));
    }

    @GetMapping("/org/{orgId}/search")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN')")
    @Override
    public ResponseEntity<AppUserResponse> searchOrgEmployee(@RequestParam(defaultValue = "0") int pageNo,
                                                             @RequestParam(defaultValue = "10") int pageSize,
                                                             @RequestParam(defaultValue = "id") String sortBy,
                                                             @PathVariable Long orgId,
                                                             @RequestParam(defaultValue = "") String query) {

        return ResponseEntity.ok(appUserService.searchOrgEmployee(pageNo, pageSize, sortBy,orgId, query));
    }

    @GetMapping("/get/info")
    @PreAuthorize("hasAnyRole('ADMIN','ORG_ADMIN','DOCTOR_RECEPTIONIST','DIAGNOSTIC_RECEPTIONIST','PHARMACIST')")
    @Override
    public ResponseEntity<Optional<AppUser>> getUserDetailsByToken (HttpServletRequest httpServletRequest) {
        String email = ((User) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        Optional<AppUser> appUser = appUserRepository.findByEmail(email);
        appUser.get().setPassword(null);
        return ResponseEntity.ok(appUser);
    }
}
