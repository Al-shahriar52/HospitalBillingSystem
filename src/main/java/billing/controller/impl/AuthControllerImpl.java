package billing.controller.impl;

import billing.controller.AuthController;
import billing.dto.LoginDto;
import billing.entity.AppUser;
import billing.exceptionHandling.ResourceNotFound;
import billing.repository.AppUserRepository;
import billing.utils.JwtUtil;
import io.jsonwebtoken.ExpiredJwtException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/auth")
public class AuthControllerImpl implements AuthController {

    private final JwtUtil jwtUtil;
    private final AuthenticationManager authenticationManager;
    private final AppUserRepository appUserRepository;

    public AuthControllerImpl(JwtUtil jwtUtil,
                              AuthenticationManager authenticationManager,
                              AppUserRepository appUserRepository) {
        ;
        ;
        this.jwtUtil = jwtUtil;
        this.authenticationManager = authenticationManager;
        this.appUserRepository = appUserRepository;
    }

    @PostMapping("/login")
    public ResponseEntity<String> generateToken(@RequestBody LoginDto authRequest) throws BadCredentialsException, ExpiredJwtException {

        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
                authRequest.getEmail(),
                authRequest.getPassword())
        );

        AppUser appUser = appUserRepository.findByEmail(authRequest.getEmail()).orElseThrow(()
                -> new ResourceNotFound("User not found by email"));

        return new ResponseEntity<>(jwtUtil.generateToken(authRequest.getEmail(),
                                                            appUser.getRole(),
                                                            appUser.getOrganization().getId()),
                                                            HttpStatus.ACCEPTED);
    }
}
