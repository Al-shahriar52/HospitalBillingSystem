package billing.controller;

import billing.dto.LoginDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;

public interface AuthController {
    ResponseEntity<String> generateToken(@RequestBody LoginDto authRequest) throws Exception;
}
