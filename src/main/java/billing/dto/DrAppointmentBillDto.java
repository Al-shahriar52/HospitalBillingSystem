package billing.dto;

import billing.entity.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Data
public class DrAppointmentBillDto {

    private Long id;

    @NotEmpty
    @DecimalMax("10000.0") @DecimalMin("0.0")
    private double fee;

    @NotNull
    private Fees type;

    @NotEmpty
    @DecimalMax("10000.0") @DecimalMin("0.0")
    private double discount;

    @NotEmpty
    @DecimalMax("10000.0") @DecimalMin("0.0")
    private double finalFee;

    @NotNull
    private String appointmentTime;

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @JsonFormat(shape=JsonFormat.Shape.STRING)
    private Date createdAt = new Date();


    private PatientDto patient;

    private DoctorDto doctor;

    private AppUserDto createdBy;

    private OrganizationDto organization;
}
