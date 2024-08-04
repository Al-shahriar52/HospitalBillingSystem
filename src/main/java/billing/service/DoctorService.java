package billing.service;

import billing.dto.DoctorDto;
import billing.entity.Doctor;
import billing.entity.DoctorType;
import billing.entity.OrgDoctor;
import billing.pageResponse.DoctorResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

public interface DoctorService {

    DoctorDto saveDoctorByadmin(Long appUserId, DoctorDto doctorDto) throws SQLIntegrityConstraintViolationException;

    DoctorDto getDoctorById(Long id);

    DoctorResponse getAllDoctor(int pageNo, int pageSize, String sortBy);

    DoctorResponse getAllDoctorByAppUserId(int pageNo, int pageSize, String sortBy, Long appUserId);

    DoctorDto updateById(DoctorDto doctorDto, Long id);

    DoctorResponse searchDoctor(int pageNo, int pageSize, String sortBy, String query);

    DoctorResponse searchOrgDoctor(int pageNo, int pageSize, String sortBy, Long orgId, String query);
}
