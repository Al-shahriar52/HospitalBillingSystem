package billing.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

@Data
public class PharmacyBillDto {

    private Long id;

    private List<Integer> medQuantities;

    @NotNull
    private double totalBill;

    @NotNull
    private double discount;

    @NotNull
    private double finalBill;

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @JsonFormat(shape=JsonFormat.Shape.STRING)
    private Date createdAt = new Date();

    private List<MedicineDto> medicines;

    private PatientDto patient;

    private OrganizationDto organization;

    private AppUserDto createdBy;
}
